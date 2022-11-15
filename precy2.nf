#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// precission of the calculation
params.GMX="gmx"        // set to gmx_d for double precision
params.RE="RE"     // Every subdir is considered a replica workdir

// names of optional input files
params.REF="" // reference coordinates for restraints; leave empty if not needed
params.PREV="" // mnemonic name of the previous workflow from which to use a .cpt file

// runtime variables
params.NTOMP="" // number of OpenMP threads per MPI rank; leave empty to set default
params.MAXWARN="" // maximum number of warnings; leave empty to determine automatically (gen-vel)

// plumed can be used only if the module version enables it
params.PLUMED="plumed.dat" // name of the plumed script; leave empty if not used
params.PLUMED_THREADS="" // number of plumed openMP threads; leave empty to set default 


process get_replicas {
  
  output:
  stdout

  """
  ls -d -- ${workflow.launchDir}/${params.RE}/*/
  """
}

process grompp {
  memory '2 GB'

  input:
  val replica

  output:
  stdout

  """
  MDP=`find ${replica} -name "*.mdp"`
  GRO=`find ${replica} -name "*.gro"`
  TOP=`find ${replica} -name "*.top"`
  NDX=`find ${replica} -name "*.ndx"`
  
  if [ ! -z ${params.PREV} ]; then
      CPT="-t "+`find ${replica} -name "${params.PREV}.cpt"`
  fi
  
  echo \${CPT}
  
  if [ ! -z ${params.REF} ]; then
      REF="${params.REF}"
  else
      REF="\${GRO}"
  fi
  
  if [ -z ${params.MAXWARN} ]; then
    GEN_VEL=`awk 'BEGIN {i = 0} /gen[-_]vel/ {if (toupper(\$3) == "YES") i = 1} END {print i}' \${MDP}`
    if [ \${GEN_VEL} -eq 0 ]; then MAXWARN=0; else MAXWARN=1; fi
  else
    MAXWARN=${params.MAXWARN}
  fi
  
  ${params.GMX} grompp -f \${MDP} \
             -c \${GRO} \
             -r \${REF} \
             \${CPT} \
             -p \${TOP} \
             -n \${NDX} \
             -o ${replica}${workflow.runName}.tpr -quiet -maxwarn \${MAXWARN}
  """
}

process mdrun {
  memory '16 GB'
  cpus 15
  debug true
  scratch true

  input:
  val x
  
  output:
  stdout
  
  """
  echo `nproc --all`
  echo `gmx --version`
  
  REPLICAS=`ls -d -- ${workflow.launchDir}/${params.RE}/*/`
  NP=`ls -d -- ${workflow.launchDir}/${params.RE}/*/ | wc -l`
  mpirun -np \${NP} gmx mdrun -v -deffnm ${workflow.runName} \
            -cpo ${workflow.runName}\
            -cpt 1 -pf ${workflow.runName}_pf.xvg\
            -px ${workflow.runName}_px.xvg\
            -plumed ${params.PLUMED} -multidir \${REPLICAS}\
            -replex 2000 -hrex -noappend -quiet
  """
}

workflow {
  Replicas = get_replicas().splitText().map{it -> it.trim()}
  input = grompp(Replicas)
  mdrun(input.min()) | view { it.trim() } // .min() is used for the mdrun to wait until all grompp jobs finnish
}

#!/bin/bash -ue
if [ -z  ]; then
    GEN_VEL=`awk 'BEGIN {i = 0} /gen[-_]vel/ {if (toupper($3) == "YES") i = 1} END {print i}' /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
us.mdp`
    if [ ${GEN_VEL} -eq 0 ]; then MAXWARN=0; else MAXWARN=1; fi
  else
    MAXWARN=
  fi
  gmx grompp -f /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
us.mdp -c /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
01.gro -r /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
01.gro -p /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
topol.top -n /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
index.ndx -o /home/boris/GMX-Nextflow/RE/01/
/home/boris/GMX-Nextflow/RE/02/
/home/boris/GMX-Nextflow/RE/03/
/home/boris/GMX-Nextflow/RE/04/
/home/boris/GMX-Nextflow/RE/05/
/home/boris/GMX-Nextflow/RE/06/
/home/boris/GMX-Nextflow/RE/07/
/home/boris/GMX-Nextflow/RE/08/
/home/boris/GMX-Nextflow/RE/09/
/home/boris/GMX-Nextflow/RE/10/
/home/boris/GMX-Nextflow/RE/11/
/home/boris/GMX-Nextflow/RE/12/
/home/boris/GMX-Nextflow/RE/13/
/home/boris/GMX-Nextflow/RE/14/
/home/boris/GMX-Nextflow/RE/15/
topol.tpr -quiet -maxwarn ${MAXWARN}

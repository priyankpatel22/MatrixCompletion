#!/bin/tcsh                                                                                                                                                                   
#$ -cwd                                                                                                                                                                        
#$ -o job_team.out                                                                                                                                                             
#$ -j yes                                                                                                                                                                     

cd /home/ppatel/SVT_MostRecent
/export/software/Matlab2012a/ -r "Test_SVT"

echo "done"

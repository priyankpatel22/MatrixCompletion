#PBS -N 'svt_job'                                                                                                                                                              
#PBS -o 'qsub.out'                                                                                                                                                             
#PBS -e 'qsub.err'                                                                                                                                                             
#PBS -W umask=007                                                                                                                                                              
#PBS -q low_priority                                                                                                                                                           
#PBS -l nodes=1:ppn=1                                                                                                                                                          
#PBS -m abe                                                                                                                                                                    
#PBS -d /home/ppatel/SVT_MostRecent/

matlab -nodisplay -r "forLoopTest, exit"
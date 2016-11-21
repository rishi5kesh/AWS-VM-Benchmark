#!/bin/bash

#Download Linpack
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/9752/l_mklb_p_2017.1.013.tgz -P /home/ubuntu  

cd
# untar linpack tar file
tar xvzf l_mklb_p_2017.1.013.tgz  

cd l_mklb_p_2017.1.013/benchmarks_2017/linux/mkl/benchmarks/linpack

# to give executable permision to files
chmod +x xlinpack_xeon64	
chmod +x lininput_xeon64   

NAME=cpu_result
EXTENSION=.txt

# run 5 times collect results & save into different file
for var in 1 2 3 4 5		
do
   echo "Started CPU BenchMark Test $var"

   FILENAME=${NAME}_${var}${EXTENSION}

# display benchmark result & also write into file
   ./xlinpack_xeon64 < lininput_xeon64 | tee /home/ubuntu/results/cpu_linpack/$FILENAME 

   echo "Completed CPU BenchMark Test $var"

done

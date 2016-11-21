#!/bin/bash

#downloading  large tar file
wget http://downloads.sourceforge.net/project/brlcad/BRL-CAD%20for%20Linux/7.26.0/BRL-CAD_7.26.0.2_Linux_x86_64.tar.gz -P /home/ubuntu



cd

# create Mixed Io benchmark result file
> /home/ubuntu/results/mixed_benchmark.txt

# run 5 times to untar the downloaded file

for var in 1 2 3 4 5		
do
    echo "Started Untar Kernel Archieve Test $var"

    begin_time=`date +%s`

    tar xvzf BRL-CAD_7.26.0.2_Linux_x86_64.tar.gz

    finish_time=`date +%s`

#calculate time taken to untar the file
    elapsed_time=$((finish_time-begin_time))

    echo "Untar Time =>> $elapsed_time seconds "
    printf "Mixed IO test $var : \n\n  Untar Time =>> $elapsed_time seconds: \n\n" >> /home/ubuntu/results/mixed_benchmark.txt
    echo "Completed Untar Kernel Archieve Test $var"

#remove the untar-ed directory
    sudo rm -r BRL-CAD_7.26.0_Linux_x86_64

done


echo "#### Test Completed ####"


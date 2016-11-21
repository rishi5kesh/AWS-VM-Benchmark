#!/bin/bash
sudo apt-get update


# create directories for saving results
mkdir /home/ubuntu/results
mkdir /home/ubuntu/results/iozone
mkdir /home/ubuntu/results/cpu_linpack


echo "LinPack Benchmark for CPU"
#start Linpack test
./linpack.sh

cd /home/ubuntu/AWS_VM_Benchmark

echo "iozone for I/O BenchMarking"
# start IOZONE test
./iozone.sh

cd /home/ubuntu/AWS_VM_Benchmark

echo "CPU/IO mixed benchmark by Untaring a big tar file"

#start mixed IO test
./mixed_bm.sh 


													>   /home/ubuntu/results/info.txt
printf "\n\nLinux Version Information: \n\n"    	>>  /home/ubuntu/results/info.txt
lsb_release -a 										>>  /home/ubuntu/results/info.txt

printf "\n\nCPU Information: \n\n"				    >>  /home/ubuntu/results/info.txt
lscpu 		  									    >>  /home/ubuntu/results/info.txt

printf "\n\nMemory Information: \n\n" 				>>  /home/ubuntu/results/info.txt
cat /proc/meminfo 									>>  /home/ubuntu/results/info.txt

printf "\n\nDisk Information: \n\n" 				>>  /home/ubuntu/results/info.txt
sudo parted -l 										>>  /home/ubuntu/results/info.txt
df 													>>  /home/ubuntu/results/info.txt


#PAck results into tar file
tar -zcvf /home/ubuntu/results.tar.gz /home/ubuntu/results

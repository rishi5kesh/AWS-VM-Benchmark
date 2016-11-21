#!/bin/bash

#Download Iozone
wget http://www.iozone.org/src/current/iozone3_459.tar -P /home/ubuntu

cd
# untar IOzone tar file
tar xvf iozone3_459.tar 

cd iozone3_459/src/current

# Install dependencies
sudo apt-get install build-essential
sudo apt-get install make

make

#make the iozone files
make linux

NAME=io_result
EXTENSION=.ods

# run 5 times collect results & save into different file

for var in 1 2 3 4 5	
do

	echo "Started I/O BenchMark Test $var"

	FILENAME=${NAME}_${var}${EXTENSION}
	
#Run IOzone test
	./iozone -a -+u -i 0 -i 1 -i 2 -i 5 -R -b /home/ubuntu/results/iozone/$FILENAME

	echo "Completed I/O BenchMark Test $var"

done

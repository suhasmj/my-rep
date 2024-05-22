#! /bin/bash
mkdir five
cd five
for i in 1 2 3 4 5
do
    mkdir "dir$i"
    cd dir$i
    for j in 1 2 3 4
    do
	mkdir "file$j"
	cd file$j
	for k in 1 2 3 4 5:
	do
		if [[ $k > $j ]]
		then
			break
		else	
			echo $j >> file$j.txt
		fi
	done
	cd ..
    done
    cd ..
done

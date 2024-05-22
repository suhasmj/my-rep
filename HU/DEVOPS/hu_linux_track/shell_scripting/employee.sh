#! /bin/bash
if [[ $1 > 40 ]];
then
	overtime=$(($1 - 40))
	overtimepay=$(($overtime * 12))
	echo "overtimepay is,$overtimepay"
else
	echo "you have to work more than 40 hours to get an overtime pay"
fi

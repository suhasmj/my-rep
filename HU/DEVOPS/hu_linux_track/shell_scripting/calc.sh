#! /bin/bash
for i in 1 2 3 4
do
	case $i in
		1) echo "addition of two integers $1 and $2 is "
		   echo $(($1 + $2))
		   ;;
		2) echo "subtraction of two integers $1 and $2 is "
		   if [[ $2 > $1 ]];
			then
				echo $(($2 - $1))
			else
				echo $(($1 - $2))
			fi ;;
		3) echo "Mupltiplication of two integers $1 and $2 is"
		   echo $(($1 * $2)) ;;
		4) if [[ ($1 == 0) || ($2 == 0) ]];
		   then
			echo "cant divide by zero"
		   else
			echo "Division of two integers $1 and $2 is "
			echo $(($1/$2))
		   fi
		   ;;
	esac
done

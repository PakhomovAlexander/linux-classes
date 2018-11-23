#!/bin/bash
. /home/alex/linux-classes/fifth/fuct.sh

function fuctorial {
if [ $# -eq 0 ] 
then 
	echo "this function needs one parameter!"
elif [ $# -gt 1 ]	
then
	echo "this function needs one just parameter!"
elif [ $1 == "-h" ]
then
	echo "Usage: fuctorial 10"
        echo "Returns 10!"
elif [[ $1 != ?(-)+([0-9]) ]]
then
	echo "this function needs a number!"
else 
	echo "The factorial of $1 is: $(fuct $1)"
fi
} 

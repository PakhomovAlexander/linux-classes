#!/bin/bash

last | 
	sed -r 's/.*running.*|.*logged in.*//g' | # !!! 
	sed -r 's/\s([a-zA-Z0-9.:-])*//g' | 
	sed 's/(/ /g' | 
	sed 's/)//g' | 
	sed '/./!d' | 
	sed '$d' | 
	sort -k1 > /tmp/file.txt

mkdir -p /tmp/task3

while read line; do 
	arr=(${line// / })
        echo "${arr[1]}" >> /tmp/task3/${arr[0]}
done </tmp/file.txt

for file in /tmp/task3/*; do
        d=0
	h=0
	m=0
	while read line; do
		arr1=(${line//:/ })
		arr2=(${arr1[0]//+/ })

		if [ ${#arr2[@]} == 1 ]; then
			h=`expr $h + ${arr2[0]}` 
		else 
			d=`expr $d + ${arr2[0]}`
			h=`expr $h + ${arr2[1]}`
		fi

		m=`expr $m + ${arr1[1]}` 
	done <$file
	
	username="$(cut -d'/' -f4 <<<$file)"
	h=`expr $h + $m / 60`
	m=`expr $m % 60`
	d=`expr $d + $h / 24`
	h=`expr $h % 24`
	echo "user $username spend $d days,$h hours and $m minutes" 
done;

rm /tmp/task3/*

#!/bin/bash 

last | awk '$NF ~ /^\([0-9]+:[0-9]+\)$/{split($NF,t,":");a[$1]+=t[1]*60+t[2]}END{for(x in a){print x,a[x]}}'

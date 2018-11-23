#!/bin/bash 

last | awk '
$NF ~ /^\([0-9+]+:[0-9]+\)$/ {
split($NF,t,":"); 

a[$1]+=t[2];
h = substr(t[1],2,4);
d = "";
if (index(h,"+") !=0 ) {h = split(h,tmp,"+"); h = tmp[2]; d = tmp[1]};
b[$1]+=h;
c[$1]+=d;
}
END{	
for(x in a){
	b[x] = int(a[x]/60) + b[x];
	c[x] = int(b[x]/24) + c[x];
	print x,(a[x]%60),(b[x]%24),c[x]
}}' | 
       	awk '
BEGIN { 
	print "\\documentclass{article}\\author{A.Pakhomov}\\title{Users time}\\begin{document}\\maketitle\\begin{tabular}{cccc}"
	print "user & minutes & hours & days \\\\\n"
} {
	printf "%s & %s & %s & %s \\\\\n", $1, $2, $3, $4
} 
END{ print "\\end{tabular}\\end{document}" }' | 
	pdflatex --jobname table --

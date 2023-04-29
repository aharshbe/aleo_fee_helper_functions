#!/bin/bash

# determine size of file in kilobytes, `.` refers to your current directory; you can provide a relative or complete path here to any Leo application as an alternative
sizeinkb(){
	size=$(find . -type f -exec ls -l {} \; | awk '{sum += $5} END {print sum}') 
	echo "$((${size} * .0000001)) KB"
}

# determine number of aleo credits based on file size
aleocredits(){
	sizeinkb | awk '{$1/=1024;printf "you should pay %.2f Aleo credits\n",$1}'
}

# convert credits to gates
convertcredits(){
	sizeinkb | awk '{$1/=1024;printf "%.2f\n",$1}' | awk '{$1*=10000000;printf "your fee in gates is %.0f\n",$1}'
}

# list all fees
lsaleofees(){
	sizeinkb
	aleocredits
	convertcredits
}

# EOF

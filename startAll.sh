#!/usr/bin/env bash

for dir in `ls`; do
	if test -d $dir ; then
		echo "start....[$dir]" 
		cd $dir
		if [ ! -f "start.sh" ];
		then
			echo "{$dir} not exists start.sh , do nothing!!"
		else 
		    sh ./start.sh

		fi	
		cd -
		echo "start complete...[$dir]"
    fi
done
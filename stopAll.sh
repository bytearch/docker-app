#!/usr/bin/env bash

for dir in `ls`; do
	if test -d $dir ; then
		echo "stop....[$dir]" 
		cd $dir
		if [ ! -f "stop.sh" ];
		then
			echo "[$dir] not exists stop.sh , do nothing!!!"
		else 
		    sh ./stop.sh

		fi	
		cd -
		echo "stop complete...[$dir]"
    fi
done
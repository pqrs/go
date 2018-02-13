#!/bin/bash

CONFIG_FILE="$HOME/go.cfg"

function needhelp {
	echo "Go! - Copyright © 2009-2018 Alvaro Piqueras."
	echo "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>."
    echo "This is free software: you are free to change and redistribute it."
	echo "There is NO WARRANTY, to the extent permitted by law."
	echo
	echo "Usage: go [directory] [-a] [-l] [-r directory] [-h]"
	echo
	echo "Options:"
	echo
	echo "	-a, -add	 Adds current directory to the list."
	echo "	-l, -list	 Lists currently defined directories."
	echo "	-r, -remove	 Removes a directory from the list, i.e. 'go -r foo' removes directory 'foo'."
	echo "	-h, -help	 Shows this help."
	echo
}

case $1 in
	""				)	echo "go: No arguments supplied"
						echo "Usage: go [directory] [-a] [-l] [-r directory] [-h]"
						echo "Type 'go -h' for full help";;

	"-h"|"-help"	) 	needhelp;;

	"-a"|"-add"		) 	CURRENT_DIR=$(pwd)
						LAUNCHER=$(basename $CURRENT_DIR)
						echo $LAUNCHER:$CURRENT_DIR >> $CONFIG_FILE;;

	"-r"|"-remove"	)	if [ "$2" == "" ]; then
							echo "Usage: go -r directory"
						else
							sed -i "" "/$2:/d" $CONFIG_FILE
						fi;;


	"-l"|"-list"	) 	echo "Go! - Copyright © 2009-2018 Alvaro Piqueras."
						echo "Currently defined directories:"
						echo
						cat $CONFIG_FILE;;

	*				) 	FOUND="0"
						while read LINE
						do
							dirtogo=${LINE%:*}
							dirtogofullpath=${LINE#*:}

							if [ $dirtogo == $1 ]; then
								cd $dirtogofullpath
								FOUND="1"
							fi

						done < $CONFIG_FILE

						if [ $FOUND == "0" ]; then
							echo $1": no such directory"
							echo "If you want to add it to the list, change to that directory and type 'go -a'."
							echo "Type 'go -h' for full help"
						fi;;
esac
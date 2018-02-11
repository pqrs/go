#!/bin/bash

CONFIG_FILE="$HOME/go.cfg"

function needhelp {
	echo
	echo "go! - Copyright © 2009 Alvaro Piqueras."
	echo "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>."
    echo "This is free software: you are free to change and redistribute it."
	echo "There is NO WARRANTY, to the extent permitted by law."
	echo
	echo "Usage: go [directory] [-a] [-l] [-r directory] [-h]"
	echo
	echo "Options:"
	echo
	echo "	-a, -add		Adds current directory to the list in go.cfg for later use."
	echo "	-l, -list		Lists current defined shortcuts in go.cfg."
	echo "	-r, -remove		Removes a directory from the list, i.e. 'go -r foo' removes directory 'foo'."
	echo "	-h, -help		Shows this help."
	echo
}

case $1 in
	""				)	echo "go: missing operand"
						echo "Type 'go -h' for more information";;

	"-h"|"-help"	) 	needhelp;;

	"-a"|"-add"		) 	CURRENT_DIR=$(pwd)
						LAUNCHER=$(basename $CURRENT_DIR)
						echo $LAUNCHER:$CURRENT_DIR >> $CONFIG_FILE;;

	"-r"|"-remove"	)	sed "/$2:/d" $CONFIG_FILE;;

	"-l"|"-list"	) 	echo "go! - Copyright © 2009 Alvaro Piqueras."
						echo "Current dir shortcuts are:"
						echo
						cat $CONFIG_FILE;;

	*				) 	FOUND="0"
						while read LINE
						do
							dirtogo=${LINE%:*}
							dirtogofullpath=${LINE#*:}

							if [ $dirtogo == $1 ]; then
								cd $dirtogofullpath && ls
								FOUND="1"
							fi

						done < $CONFIG_FILE

						if [ $FOUND == "0" ]; then
							echo "Can't find" $1
							echo "If you want to add it to config file, go to directory and type 'go -a'."
							echo
							needhelp
						fi;;
esac
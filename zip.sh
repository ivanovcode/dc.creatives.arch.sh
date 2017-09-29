#!/bin/bash
IFS=$'\n'
function z {
	for u in $(grep --include=\*.{php,html} -rwl './public/' -e "type_page: '$1'")
	do	
		u=$(echo "$u" | sed 's/index.php//g' | sed 's/index.html//g')
		i=($(for c in $(grep --include=\*.{php,html} -rwh $u -e "id_page")
		do
		echo "${c:1:30}" | grep -o '[0-9]*'
		done))
		if [ -d $u ]
		then
			zip -r ./zip/$1/${i[0]} $u	
		fi	
	done
}
z prelanding ; z landing

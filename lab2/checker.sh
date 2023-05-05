function checkFile {
	FILENAME=${1}
	if [ -f ${FILENAME} ]
	then
		return 0
	else
		return 1
	fi
}


function checkRFile {
        FILENAME=${1}
        if [ -r ${FILENAME} ]
        then
                return 0
        else
                return 1
        fi
}

function checkWFile {
        FILENAME=${1}
        if [ -w ${FILENAME} ]
        then
                return 0
        else
                return 1
        fi
}


function checkInteger {
	VAL=${1}
	if [ $(echo ${VAL} | grep -c "^[0-9]*$") -eq 1 ]
	then
		return 0
	else
		return 1
	fi
}

function checkNInteger {
        VAL=${1}
        if [ $(echo ${VAL} | grep -c "^\-\{0,1\}[0-9]*$") -eq 1 ]
        then
                return 0
        else
                return 1
        fi
}


function checkFloatPoint {
	local num=${1}
	local regx='^[+-]?[0-9]{1,}\.?[0-9]{1,}$'
	if [ ${#} -eq 1 ]
	then
		if [ $num=${regx} ]
		then
			echo "valid num"
			return 0
		else
			echo "not valid"
			return 1
		fi
	else
		echo "insert only one parameter"
		return 1
	fi
}


function checkEmail {

        VAL=${1}
	echo "${VAL}"
	local regx='^([a-zA-Z0-9_.+-]{1,})@([a-zA-Z0-9-]{1,})\.([a-zA-Z]{2,6})$'
	echo "${regx}"

	if [ ${#} -eq 1 ]
	then
##	 	if [ ! $(echo ${VAL} | grep -c ^[0-9]*$) -eq 1 ]
		if [ ${VAL}=${regx} ]
		then
			echo "valid email"
                	return 0
        	else
			echo "not valid email"
                	return 1
        	fi
	else
		echo "insert only 1 value"
		return 1
	fi
}

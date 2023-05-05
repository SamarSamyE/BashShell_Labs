function authenticate {
	echo "you are Authentication"
}

function querystudent {
	echo -n "Enter student name to query GPA : "
	read NAME
	LINE=$(grep "^${NAME}:" datafile)
	if [ -z ${LINE} ]
	then
		echo "Error, student name ${NAME} not found"
	else
		GPA=$(echo ${LINE} | awk ' BEGIN { FS=":" } { print $2 } ')
		echo "GPA for ${NAME} is ${GPA}"
	fi
}

function insertstudent {
	echo "Inserting a new student"
	echo -n "Enter name : " 
	read NAME
	echo -n "Enter GPA : "
	read GPA
	if [ $(checkFloatPoint ${GPA}) -eq 0 ]
	then
		echo "${NAME}:${GPA}" >> datafile
	else
		echo "please insert valid GPA"
	fi
}

function deletestudent {
	echo "Deleting an existing student"
	echo -n "Enter studen to delete : "
	read NAME
	LINE=$(grep "^${NAME}:" datafile)
        	if [ -z ${LINE} ]
        	then
          		echo "Error, student name ${NAME} not found"
        	else
		echo "Are you sure to delete ?"
		echo "Press Y to confirm or N to cancel"
		read Confirm

		case $Confirm in
			"Y")     grep -v "^${NAME}:" datafile > /tmp/datafile
			         cp /tmp/datafile datafile
			         rm /tmp/datafile;;
                     	"N") echo "we did not delete it";;
	*) echo "invalid input";;
		esac

        fi
}

function updatestudent {
	echo "Updating an existing student"
        echo -n "Enter student name to update : "
        read NAME
        LINE=$(grep "^${NAME}:" datafile)
                if [ -z ${LINE} ]
                then
                        echo "Error, student name ${NAME} not found"
                else
               		echo "Enter new GPA of the student"
                	read NGPA
		        if [ $(checkFloatPoint ${NGPA}) -eq 0]
        		then
        		 	grep -v "^${NAME}:" datafile > /tmp/datafile
				echo "${NAME}:${NGPA}" >> /tmp/datafile	
                         	cp /tmp/datafile datafile
                         	rm /tmp/datafile
        		else
                		echo "please insert valid GPA"
        		fi
		fi
}

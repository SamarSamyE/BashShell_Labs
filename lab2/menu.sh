source dbos.sh
function runMenu {
	echo "Enter option from 1-6"
local OPT=0
while [ ${OPT} -ne 6 ]
do
echo -e "\t1-Authenitcate"
echo -e "\t2-Get GPA for a student"
echo -e "\t3-Insert a new student"
echo -e "\t4-Delete a student"
echo -e "\t5-Update a student information"
echo -e "\t6-Quit"
read OPT
case "${OPT}" in
	"1")
		authenticate
		;;
	"2")
		querystudent
		;;
	"3")
		insertstudent
		;;
	"4")
		deletestudent
		;;
	"5")
		updatestudent
		;;
	"6")
		echo "thanks for visit"
		;;
	*)
		echo "invalid option"
esac
done
}

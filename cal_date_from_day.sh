#!/bash/sh
#$1 = year
#$2 = month
#$2 = day

export LANG=en

if [ $# -ne 3 ] ; then
    echo "need argument
    ex> $0 <year> <month> <day>
    "
    exit
fi

day=$3
date_list=()
temp_day=""
temp_date=""
temp_month=""

cur_year=$1
cur_month=$2
cur_date="01"
cur_day="${cur_year}${cur_month}${cur_date}"

#echo "cur_day:"$cur_day
#echo "day:"$day

for (( i=0; i<31; i++ ))
do
	temp_day=$(date "--date=${cur_day} -d +${i} day" +%a)
	temp_date=$(date "--date=${cur_day} -d +${i} day" +%d)
#	temp_month=$(date "--date=${cur_day} -d +${i} day" +%m)
#echo "temp_day:"$temp_day" / temp_date:"$temp_date " / temp_month:"$temp_month
#	if [[ "$temp_month" != "$cur_month" ]];then
#		break;
#   fi
#	if [[ "$temp_date" == "31" ]];then
#		break;
#   fi
	if [[ "$temp_day" == "$day" ]];then
    	date_list+=($temp_date)
    fi
done

for LOC in ${date_list[@]};
do
	echo $LOC
done


#file_name contains full file name of the files present inside
# the current working directory
for file_name in $(ls)
do
	#separate year and day from file_name
	year_day="${file_name%-*}"

	#separate year from year_day
	year="${year_day%-*}"
	#separate day from year_day
	day="0${year_day##*-}"
	#separate filename(1.jpg , 2.jpg etc.) from full file_name and concat "photos" infront of file name
 	file="photos${file_name##*-}"

	#check if the directory with a specific year is present or not
	if [ ! -d $year ]
	then
		# create the directory if not present
		mkdir $year/$day -p
	fi

	#if year directory is present but day not present 
	if [ ! -d $/year/$day ]
	then
		# create day directory inside appropriate year directory
		mkdir $year/$day -p
	fi

	# finally move the files to appropriate directory
	mv $file_name $year/$day/$file.jpg

	#echo $year $day $file
done

if [ -z $1 ];then
	echo "Enter a txt file to extract words from"
else
	for i in $(cat $1); do
		rmdir $i
	done
fi

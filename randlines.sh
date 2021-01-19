#!/bin/bash

# to check if first parameter exists and give default value
if [ -z "$1" ]
  then
    FILE_NAME=file1
    SORTED_FILE_NAME=file2
    else
    FILE_NAME=$1"1"
    SORTED_FILE_NAME=$1"2"
fi

# to check if second parameter exists and give default value
if [ -z "$2" ]
  then
    MAX_FILE_SIZE=1000
    else
    MAX_FILE_SIZE=$2
fi


FILE_SIZE=0
> $FILE_NAME

# to write  in file until less than given value 

while [ $FILE_SIZE -le $MAX_FILE_SIZE ]
do
#echo $FILE_SIZE
# to create  randon string
RAND_NO=$(cat /dev/urandom | tr -dc 'A-Za-z' | fold -w15 | head -n 1)
echo $RAND_NO >> $FILE_NAME
FILE_SIZE=$(wc -c <$FILE_NAME)
done

# sorting and wrting a new file 
sort $FILE_NAME | sed '/^[aA]/d' > $SORTED_FILE_NAME

FILE_NAME_LINE_COUNT=$(wc -l <$FILE_NAME)
SORTED_FILE_NAME_LINE_COUNT=$(wc -l <$SORTED_FILE_NAME)
LINE_COUNT_DIFF=$(( $FILE_NAME_LINE_COUNT -  $SORTED_FILE_NAME_LINE_COUNT ))

echo $FILE_NAME" have "$FILE_NAME_LINE_COUNT" line"
echo $SORTED_FILE_NAME" have "$SORTED_FILE_NAME_LINE_COUNT" line"
echo $LINE_COUNT_DIFF" line were removed"










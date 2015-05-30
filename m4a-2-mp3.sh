#!/bin/bash

STARTTIME=$(date +%s)
source config.cfg

IFS=',' read -ra newarray <<< "$paths"

#Counter used for calculating the percentage of process completion
NEWCOUNTER=1

#Default quality is medium
QUALITY_NO=2

#decide what quality the user wants
if [[ "$quality" == "high" ]]; then
    QUALITY_NO=1
elif [[ "$quality" == "low" ]]; then
    QUALITY_NO=4
fi

#configure the delete option
if [[ "$delete" == "true" ]]; then
    DELETE=true
else
    DELETE=false
fi

#temp counter to get the total number of files
COUNTER=0

for element in "${newarray[@]}"; do
    newcount=$(find "$element"/*.m4a -maxdepth 1 -type f|wc -l)
    let COUNTER=COUNTER+newcount
done
for element in "${newarray[@]}"; do
    for f in "$element"/*.m4a; do 
        echo  -e "\033[31;5mConverting : \033[0m $f"
        percentage=$(echo "scale=2; $NEWCOUNTER/$COUNTER * 100" | bc)
        ffmpeg -i "$f" -codec:v copy -codec:a libmp3lame -q:a $QUALITY_NO "${f%.m4a}.mp3" > /dev/null 2>&1 
        echo  -e "\033[32;5mFinished : \033[0m $percentage %" 
        let NEWCOUNTER+=1
    done
done

#check if delete is set
if [[ "$delete" == "true" ]]; then
    echo  -e "\033[31;5mDeleting all m4a files\033[0m"
    for element in "${newarray[@]}"; do
        rm "$element"/*.m4a
    done
fi
ENDTIME=$(date +%s)
echo -e "\033[33;5mCOMPLETE (Took $(($ENDTIME - $STARTTIME)) seconds)\033[0m"
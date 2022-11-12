#!/bin/bash
rec="## "`date "+%Y/%m/%d-%A"`"\n"
rec=$rec"### ToDo\n|ToDo|result|\n|-|-|\n"
for i in $@
do
	rec=$rec"|"$i"||\n"
done
rec=$rec"\n### 作業記録\n"
for i in $@
do
	rec=$rec"#### "$i"\n"
done

echo -e $rec | xclip -selection clipboard

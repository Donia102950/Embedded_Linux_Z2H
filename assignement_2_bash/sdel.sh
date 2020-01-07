#assignment two to safe delete any files 

#first we must include the bash path to run by command ./ if we run by command bash filename we not need it
#............# 
#!/bin/bash


#first take file name as argument by $1

#then check if file compressed or not 

if file --mime-type "$1" | grep -q zip
then
  echo "$1 is gzipped"
  filename=$1
elif file --mime-type "$1" | grep -q gzip
then
  echo "$1 is gzipped"
  filename=$1
else
  #if not compressed i will compress it 
  echo "$1 is not gzipped"
  zip $1.zip $1
  filename=$1.zip
fi

#then make directory called Trash and if found not create it again and this in folder called safely_delete

if [ ! -d ~/safely_delete/Trash ];
then 
  mkdir -p ~/safely_delete/Trash
fi

#then move the file to directory 
mv $filename ~/safely_delete/Trash

#to check if file not modified for 48 hours and delete it 
cd ~/safely_delete/Trash
 
#to check if file not modified for 48 hours or more then delete it 
find . -mtime +1 -delete

#this for try the modified file from now to 1 day only to check it code correct 
#find . -mtime 0 -delete


#assignment 1 to make portable phonebook

#first we must include the bash path to run by command ./ if we run by command bash filename we not need it
#............# 
#!/bin/bash

#to check if the file of database exist before we create it again 
#I make folder named by phonebook which include my database from home directory
cd ~/phonebook
touch -a DataBase

#to check if user not enter any arguments and print all the arguments 
if [ $# -eq 0 ]
then 
echo no arguments so my options are
echo to enter new contact -i
echo to view all contacts -v
echo to search about contacts "-s"
echo to delete all contacts "-e"
echo to delete one contach "-d"

#to make user enter his option 
read -p "enter the option" option

#if user enter argument directly 
else
option = $1
fi

#to switch cases written 

case $option in 
	#to enter new user 
	"-i")
		clear
 		read -p "enter the name  " name
		read -p "enter the phone " phone
		echo $name $phone >> DataBase
		echo the contact is added
		;;
	#to view all contacts 
	"-v")
		clear
		echo the all contacts are :
		cat DataBase
		;;
	#to search about contact by name
	"-s")
		clear
		read -p "enter name needed to search about" name
		grep -nr "$name" DataBase
		;;
	#to delete all contacts
	"-e")
		clear
		cat /dev/null > DataBase
		echo all contacts deleted
		;;
	#to delete one contact
	"-d")
		clear
		echo if the name consists of double parts please enter them 
		echo
		echo if not added them  the all  contacts start with first part will delete
		echo 
		read -p "enter name needed to delete" name
		sed -i "/$name/d" DataBase
		
		echo the contact deleted 
		echo contacts after delete 
		cat DataBase
		;;		

	#if argument not correct
	*)
		echo the argument not correct
		;;
esac

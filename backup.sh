#!/bin/bash

read -p "Click here to check the files: "
direct=$1
if [ -d $direct ]
then
   echo "Yes..!! Directory exists"
   echo "If you would like to check the files inside the folder... click yes"
   read yes
   if [[ $yes = "yes" ]]
   then
   cd $1
   tar cvzf messages.gz /var/log/messages
   sleep 2
   echo "Backup of the Messages has been  created inside the $1 folder"
   fi
else
echo "The folder named $1 does not exists !!!"
   read -p " Would like to create Now ? " yes
   if [[ $yes = "yes" ]]
      then
      mkdir $1
      cd $1
      tar cvzf messages.gz /var/log/messages
      echo "Backup of the messages has been created inside the  $1 folder upon your request"
      ls -Sha | grep -i "messages"
else
     echo "OK. No problem !! Bye"
   fi
fi 

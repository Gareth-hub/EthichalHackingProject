#Ipsweeping can be a tedious proccess from the standpoint of an ethichal hacker especially when it comes to sweeping multiple networks therefore this script was created.
#This Bash script automates the ipsweeping proccess and allows for a hacker to sweep a network for connected ips by simply entering the command shown below.
#However in order to correctly use this script it must first be created and given permissions
#Firstly enter the command nano ipsweeper.sh this will take you to the text editor. Paste in the information given below and then press control X followed by the 'Y' and enter keys.
#Secondly you will need to give the script permissions this is done by entering the command #sudo chmod +x ipsweeper.sh. Once done you can run the script

#!/bin/bash

targetip=$1
sweeplist=$2

if [ "$1" == "" ] #used to check the user has provided a valid target ip to be swept, if empty the echos will run to tell the user what to do
then
echo "Usage: ./ipsweeper.sh xxx.xxx.xxx"
echo "Example: ./ipsweeper.sh 198.162.102 mytextfile.txt" #command used to run the script and assign the values targetip and sweeplist.
else #if a valid ip address has been entered the sweep will initialize
for ip in `seq 1 254`; do #this means that for all the ips between the ip address 192.168.0.1 to 192.168.0.254 will be scanned 
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & #grep is used to display that ip addresses that respond to the pings while cut is used to remove the spaces between the information,
                                                                        #-f limits the fields of information we want returned and tr -d is used to remove the ':' at the end of an ip address.        
done > $2 # #$2 is used here to insert this filtered information in to a textfile the name of this file was assigned by the user 
fi #fi closes the if statement and exits the script.

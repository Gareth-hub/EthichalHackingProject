#This is a bash script file that was created to sweep a target network for connected devices and their ips and then uses nmap to scan these discovered
#targets in search of open ports and potential vulnerabilities. The way this works in that the user will enter the target ip address as well as a name
#they wish to assign to a textfile that will contain the list of Ips found in the sweep. This textfile can be accessed using the cat command with the filename
#e.g cat mytextfile.txt or it can be accessed within the editor by using the command nano followed by the file name e.g nano mytextfile.txt

#This bash script is a combination of the ipscan.sh and ipsweeper.sh scripts also created during this project 

#!/bin/bash

target=$1
listname=$2

if [ "$1" == "" ] #ensures the user enters the required information before proceeding
then
echo "Usage: ./ipsweepandscan.sh <Network Ip>"
echo 'Example: ./ipsweepandscan.sh 192.168.0 '
else
for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" > $2  & #returns only the pings that meet the requirements specified and adds them to the specified file

for ip in $(cat $2 ); do nmap -Pn $ip; done #Runs an nmap scan on all of the ip addresses located in the file created by the user during the ipsweeep
done
fi #in bashscripting an if statemenment is closed by its inverse which is why it started with if and ends with fi

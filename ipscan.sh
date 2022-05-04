#This Bashscript was created to be used after the use of the ipsweeper.sh script and is created the same way using the nano command and given permissions with the sudo chmod command.
#This script was created to simply the process of scanning the ips located by the ipsweeper and to provide the user with easier to read information
#Performing these scans manually can be a very repetitive task depending on the number of ips returned by the sweeper script.

#!/bin/bash

if [ "$1" == "" ] #checks if the user has inputed an ip address or has left the target ip blank
then
echo "Usage: ./ipscan.sh <Filename>" #messages used to let the user know what information needs to be entered for the script to run correctly
echo 'Example: ./ipscan.sh mytextfile.txt ' #an example of how the command should look once entered by the user
else
for ip in $(cat $1 ); do nmap -Pn $ip; done #the use of -Pn skips the host discovery process since the hosts have been discovered by the ipsweeper and are known as online
                                            #cat calls all the information from the selected list which is then individually scanned by nmap
fi


#!/bin/bash
# Pineapple Smasher

##### Detection #####
#nmcli --fields BSSID,SIGNAL,SSID dev wifi list > signal.current

# Screen Maintanance
clear

# Pineapple Smash Banner
echo -e "\e[1;33m  _____ _                              _     \e[0m \e[1;31m    _____                     _     \e[0m";
echo -e "\e[1;33m |  __ (_)                            | |     \e[0m \e[1;31m  / ____|                   | |    \e[0m";
echo -e "\e[1;33m | |__) | _ __   ___  __ _ _ __  _ __ | | ___ \e[0m \e[1;31m | (___  _ __ ___   __ _ ___| |__  \e[0m";
echo -e "\e[1;33m |  ___/ | '_ \ / _ \/ _\` | '_ \| '_ \| |/ _ \ \e[0m \e[1;31m \___ \| '_ \` _ \ / _\` / __| '_ \ \e[0m";
echo -e "\e[1;33m | |   | | | | |  __/ (_| | |_) | |_) | |  __/  \e[0m \e[1;31m____) | | | | | | (_| \__ \ | | |\e[0m";
echo -e "\e[1;33m |_|   |_|_| |_|\___|\__,_| .__/| .__/|_|\___| \e[0m \e[1;31m|_____/|_| |_| |_|\__,_|___/_| |_|\e[0m";
echo -e "\e[1;33m                          | |   | | \e[1;34mVersion 0.1  Created by roobixx\e[0m              ";
echo -e "\e[1;33m                          |_|   |_| \e[0m 						                       ";
echo

# Define Variables
break="===================================================="

# Pineapple Smash Control Setup
echo "Welcome to Pineapple Smash!"
echo 
echo "The purpose of Pineapple Smash is to detect and elimate potential attacks "
echo "from Karam based attacks and Rougue Access Points"
echo
echo "To start you must provide Pineapple Smash with a control SSID that will be used to compare"
echo "to the APs that are currently available within your location"
echo
echo $break
echo
echo -n "What is your control SSID?: "
read control
echo
echo $break
echo -e "The control value you selected is : \e[1;31m$control\e[0m"
echo
read -s -n 1 -p "Press any key to continue..."
echo
echo $break
if nmcli -t -field ssid dev wifi list | grep "$control" >> /dev/null
	then
	zenity --question --title="Pineapple Smash" --text "WARNING: A rogue access point running karma is nearby. Would you disable wireless now?"
	if [[ $? == 0 ]] ; then
   		rfkill block wifi
   		zenity --warning --text "Your wireless has now been disbaled. To re-enable either run 'rfkill unblock wifi' or reboot"		
	else
   		zenity --question --text "WARNING: A rogue access point running karma is nearby. Would you like to go on the offensive?"
		if [[ $? == 0 ]] ; then
   			rfkill block wifi
   			zenity --warning --text "Your wireless has now been disbaled. To re-enable either run 'rfkill unblock wifi' or reboot"
		else
			clear
   			exit
		fi
	fi
else
	clear
	echo -e "\e[1;34mYour control was not found in your area.\e[0m"
	echo
	sleep 1
	echo $break
	echo "Process is now terminating..."
	sleep 2
	clear
	echo "Goodbye!"
	sleep 1
	clear
	exit
fi


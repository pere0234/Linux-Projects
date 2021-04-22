#!/bin/bash
#Daniel Pereira Castillo
#User and Group Management Script

#this function prompts the program user to
#create a new user, home directory, and default shell
function createUser() {
clear
echo "You chose $choice - Create a new user "
echo "Enter the user's name: " 
read username
echo -n "Enter the user's home directory: "
read homedirectory
echo -n "Enter the default login shell: "
read defaultshell
sudo useradd -d "$homedirectory" -m -s "$defaultshell" "$username"
echo "You entered choice $choice"; sleep 3
}

#this function deletes a user
function deleteUser(){
clear
echo "You chose $choice - Delete an existing user "
echo "Enter the user's name: "
read username
sudo userdel -r "$username"
echo "You entered choice $choice"; sleep 3 
}

#this function changes the supplementary user group
function changeSupplementaryGroup() {
clear
echo "You chose $choice - Change supplementary group user"
echo -n "Enter the username you would like to change the supplementary group for: "
read username
echo -n "Please enter the group name to add to the account: "
read group
sudo usermod -G $group $username
echo "You entered choice $choice"; sleep 3
}

#this function changes the user's initial group
function changeInitialGroup() {
clear
echo "You chose $choice - Change initial group for user"
echo -n "Enter the user for which you'd like to change the inital group: "
read username
echo -n "Enter the group name to add to the user: "
read group
sudo usermod -g $group $username
echo "You entered choice $choice"; sleep 3
}

#this function changes the login shell of a user
function changeLoginShell() {
clear
echo "You chose $choice - Change default login shell for user"
echo -n "Enter the username for which you'd like to change the initial shell: "
read username
echo -n "Enter the new shell: "
read shell
sudo usermod -s $shell $username
echo "You entered choice $choice"; sleep 3
}

#this function changes a user's account expiry date
function changeUserAccountExpireDate() {
clear
echo "You chose $choice - Change expiration date for user account"
echo -n "Enter the user for which you'd like to change the expiration date: "
read username
echo -n "Please enter a expiration date in YYYY-MM-DD format: "
read expirydate
sudo usermod -e $expirydate $username
echo "You entered choice $choice"; sleep 3
}

#this part of the program prompts the program user with an option menu
clear
#the user's choice is resolved to a placeholder value
choice=n
#while the user doesn't quit the program
while [ "$choice" != "Q" ] && [ "$choice" != "q" ]
   do
    echo "Choose one of the following options
    A Create a user account
    B Delete a user account
    C Change supplementary group for a user account
    D Change initial group for a user account
    E Change default login shell for a user account
    F Change account expiration date for a user account
    Q Quit
	What would you like to do?"
   
    #the user's choice is read	
    read choice  
    
   #if a valid option is not entered, program prompts user to enter a valid choice 
   #for each letter selected, a different function is called
       
    if [ "$choice" = "A" ] || [ "$choice" = "a" ]
     then
	 createUser
    elif [ "$choice" = "B" ] || [ "$choice" = "b" ]
     then
 	deleteUser	     
    elif [ "$choice" = "C" ] || [ "$choice" = "c" ]
     then	
        changeSupplementaryGroup	    
    elif [ "$choice" = "D" ] || [ "$choice" = "d" ]
     then	
        changeInitialGroup    
    elif [ "$choice" = "E" ] || [ "$choice" = "e" ]
     then 
	changeLoginShell     
    elif [ "$choice" = "F" ] || [ "$choice" = "f" ]
     then
       changeUserAccountExpireDate	     
    elif [ "$choice" = "Q" ] || [ "$choice" = "q" ]
      then
       clear       
       echo "Program ended"; sleep 3
       clear       
    else
       clear
       echo "Please enter a valid command"; sleep 3
    fi 
    
done

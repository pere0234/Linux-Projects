#!/bin/bash
#Daniel Pereira
#2021-04-06
#This script performs basic add/subtract calculations

# Variables
num1=0;
num2=0;
result=0;

#Add num1 and num2 variables.
function add (){
	clear
	result=$((num1 + num2))
	echo -e "The sum of $num1 plus $num2 equals $result\n" 
}

#Subtract num1 and num2 variables.
function subtract (){
	clear
	result=$((num1 - num2))
	echo -e "The difference of $num1 minus $num2 equals $result\n"	
}

#Enter numbers to be added or subtracted
function inputNumber () {
	clear
	if [ $1 -eq 1 ]; then
		echo -n "Enter the first number (or type X to exit): "
		read num1
	else
		echo -n "Enter the second number (or type X to exit): "
		read num2
	fi

	#Check if any of the inputs are X to exit.
	if [ "$num1" == "x" ] || [ "$num1" == "X" ] || [ "$num2" == "x" ] || [ "$num2" == "X" ]; then
		exit 0;
	fi
}

# Enter the operation + or -.
function operatorInput () {
	completed=0;
	clear
	while [ $completed -eq 0 ]; do
		echo "Enter the operation from these choices:"
		echo ""
		echo "+ (Add)"
		echo "- (Subtract)"
		echo "x (Exit program)"
		echo ""
		read choice

		if [ "$choice" == "+" ]; then
			#Take num2
			inputNumber 2

			#Add the two numbers together
			add

			#Program is complete, loop exits
			completed=1;
		elif [ "$choice" == "-" ]; then
			#Take num2
			inputNumber 2

			#Subtract two numbers together.
			subtract

			#Program is complete, loop exits
			completed=1;

		elif [ "$choice" == "x" ] || [ "$choice" == "X" ]; then
			#If the input is X, program exits
			exit 0;
		else
			#Incorrect choice given
			clear
			echo "Please select one of the options."
		fi
	done
}

# This function displays menu
function menu () {

	while true; do
		echo "Please select an option:"
		echo "C) Calculation"
		echo -e "X) Exit\n"
		read -r input;

		if [ "$input" == "c" ] || [ "$input" == "C" ]; then
		#Input the first number
			inputNumber 1

		#Input the operator +/-
			operatorInput

		#If user selects X, program exits
		elif [ "$input" == "x" ] || [ "$input" == "X" ]; then
			clear
			exit 0;
		else
			#Invalid selection.
			clear
			echo "Choice not valid. Try again."

		fi
	done
}


# Checks parameters in order to allow script to be called on bash
function checkParameters (){

	# Check if there are any parameters
	if [ $# -eq 0 ]; then
		#No parameters, go to menu.
		clear
		menu
	elif [ $# -eq 3 ]; then
		#There are three parameters. Can proceed
		#Checks if the second param is + call add function
		#Else if second param is -, call subtract function
		#Else, give error
 		if [ "$2" == "+" ]; then
			num1=$1;
			num2=$3;
			add
		elif [ "$2" == "-" ]; then
			num1=$1;
			num2=$3;
			subtract
		else
			echo "The second parameter must be a + or a -"
		fi
	else
		#Number of parameters error
		echo "Insufficient parameters"
	fi
}

#Check if parameters exist on first program run.
checkParameters $*



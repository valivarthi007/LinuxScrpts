#!/bin/bash
read -p "Enter your favorite command to check its installed or not" command
if command -v $command
then
        echo "$command is available"
else
        echo "$command not available.Do you want to install(y/n)"
        read choice
fi
if [ $choice == "y"  ]
then
        sudo yum update -y && sudo yum install -y $command
        $command
fi

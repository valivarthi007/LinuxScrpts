#!/bin/bash

# Add Nessecary Inputs to create User
create_user(){
        if [ $# -lt 1 ]; then
                echo "usage: $(basename $0) <username>"
                exit 1
        elif getent passwd $1 ;then
                echo "user $1 already exists"
                exit 2
        fi
        sh=$SHELL
        sudo useradd -m -s "$sh" -d "/home/$1" $1
        getent passwd "$1"
}

#Getting Password from User
set_password(){
        while ! [ -n "$PAWD" ]
        do
                read -s -p "Enter a password for $1 :" PAWD
        done
        echo "$PAWD" | sudo passwd --stdin "$1"
}

#Creating user for all params in CMDLine Args

for u in "$@"
do
        create_user "$u"
        set_password "$u"
done

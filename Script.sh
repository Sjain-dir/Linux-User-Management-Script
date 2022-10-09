#!/bin/bash
function switch {
    echo "Switch to user $1"
    su $1;
    exit
}

function del {
    echo "Enter username to delete ::"
    read name
    sudo userdel $name
    exit  
}

function option {
    echo "";
    echo "Password for user $1 is now created";
    echo ""
    echo "-> Press 1 : if you want to add another new user";
    echo "-> Press 2 : if you want to switch to new user";
    echo "-> Press 3 : if you want to delete user";
    echo "-> Press 4 : if you want to exit program";
    read option
    if [ $option -eq 1 ]
    then echo ""
    elif [ $option -eq 2 ]
    then switch $1
    elif [ $option -eq 3 ]
    then del
    elif [ $option -eq 4 ]
    then exit
    else 
    echo "Enter valid option!!"
    option;
    fi
}

function newuser {
    echo "Enter your name :: ";
    read name;
    echo "Creating user ...";
    sudo useradd $name;
    echo "User $name created!";
    echo "Setting password...";
    sudo passwd $name;
    option $name;
}

while :
do
    newuser;
done


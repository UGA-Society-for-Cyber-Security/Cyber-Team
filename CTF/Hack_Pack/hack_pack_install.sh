#! /bin/bash

echo "
██╗   ██╗ ██████╗  █████╗     ███████╗ ██████╗███████╗
██║   ██║██╔════╝ ██╔══██╗    ██╔════╝██╔════╝██╔════╝
██║   ██║██║  ███╗███████║    ███████╗██║     ███████╗
██║   ██║██║   ██║██╔══██║    ╚════██║██║     ╚════██║
╚██████╔╝╚██████╔╝██║  ██║    ███████║╚██████╗███████║
 ╚═════╝  ╚═════╝ ╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚══════╝
"

# Colors to be used
RED='\033[0;31m'
GREEN='\033[0;32m\033[1m'
NC='\033[0m'

echo "This is the hack pack for UGA Society for Cyber Security CTF team"
echo "It contains a variety of tools useful in CTFs and good to have"
echo -e "${RED}NOTE: You need root privileges to execute this script"
echo -e "${GREEN}Are you sure you want to install these tools?"
                                                      
programs=("binwalk" "pwntools" "steghide" "upx" "pwndebug")

# List out the programs that will be used
for t in ${programs[@]}; do
    echo -e "- $t"
done

echo -en "(y/n)?: ${NC}"
# Read stdin into answer variable
read answer

# If yes, then install programs
if [ $answer = "y" ]; then
    # Loop through and install the programs
    for t in ${programs[@]}; do
	echo -e "${GREEN}Now installing $t${NC}"
	apt-get install $t
    done
# Else do not install programs    
else
    echo "No programs will be installed"
fi    



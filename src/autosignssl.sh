#!/bin/bash

# Exit codes
SSL_ERROR=1
PATH_ERROR=2
DIR_INIT_ERROR=3
CD_ERROR=4
PERMS_ERROR=5
FILE_WRITE_ERROR=6
CP_ERROR=7

# main() {

echo "
   _____          __          _________.__                _________ _________.____  
  /  _  \  __ ___/  |_  ____ /   _____/|__| ____   ____  /   _____//   _____/|    |
 /  /_\  \|  |  \   __\\/  _ \\______  \ |  |/ ___\ /    \ \\_____  \ \\_____  \\ |    |
/    |    \  |  /|  | (  <_> )        \|  / /_/  >   |  \/        \/        \|    |___
\____|__  /____/ |__|  \____/_______  /|__\___  /|___|  /_______  /_______  /|_______ \\
        \/                          \/   /_____/      \/        \/        \/         \/

-------------------------------Hello and welcome!-------------------------------

This program will help you establish a local, root SSL Certificate Authority (CA) and manage it.

You can do the following

	[*] Create a local root CA;
	[*] Generate keys;
	[*]	Generate certificate signing requests (CSRs);
	[*] Sign on certificates;
	[*] Verify certificates;
	[*] Revoke certificates

Let us get started, shall we?"

printf "Ensuring that OpenSSL is installed before running this script..."
sleep .5

# Check if OpenSSL is installed
if ! command -v openssl &> /dev/null
then
	echo "No OpenSSL, exiting..."
	exit $SSL_ERROR
fi

echo "DONE, it is indeed installed."
sleep .5

while :
do
	
	printf "\n--------------------------------------------------------------------------------\n"

	printf "\nSelect an option.
	[0] Exit.
	[1] Establish the CA.
	[2] Manage the CA
	
	Your input :: "
	read -r choice
	if [[ $choice == "0" ]]
	then
		echo Exiting...
		exit 0
	elif [[ $choice == "1" ]]
	then
		init
	elif [[ $choice == "2" ]]
	then
		manage
	else
		echo Invalid input. Try again.		
	fi
done
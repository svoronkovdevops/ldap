#!/bin/bash

spawn dpkg-reconfigure slapd

# Expecting the prompts and sending the default values or choices
expect "Omit OpenLDAP server configuration?" { send "\033[C\n" }
#expect "Omit OpenLDAP server configuration?" { send "Y\n" }
expect "DNS domain name:" { send "\b\b\b\b\b\b\b\bvsvdev.com\n" }
# Add more expect/send pairs for other prompts as needed
expect "Organization name:" { send "\b\b\b\b\b\b\b\bVSVDev\n" }
expect "Administrator password:" { send "123\n" }
expect "Confirn password:" { send "123\n" }
expect "Database backend to use:" { send "'\033[A\n'" }
expect "Do you want database to be removed when slapd is purget?:" { send "\033[D\n" }
expect "Move old database?:" { send "\033[D\n" }
expect "Allow LDAPv2protocol?:" { send "\033[C\n" }
# Waiting for the process to finish
expect eof










#echo -ne '\033[A'   # Up arrow key
#echo -ne '\033[B'   # Down arrow key
#echo -ne '\033[C'   # Right arrow key
#echo -ne '\033[D'   # Left arrow key
#echo -ne '\n'       # Enter key
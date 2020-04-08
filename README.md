# SMBclientBrute
Script to perform Smbclient Dictionary Attack.


## Why
I created this simple script during a CTF from hackthebox because i found a list of 10 users and a default password.
With this script i tested the password for all the users in a few secs.

I used it in another CTF: i put in psw.txt some simple passwords (password, password123, ecc) and i tried it for all the users.
One of them was using pass123 as password lol :-)


## Usage
This script automate logins with smbclient. Can be used to perform bruteforce/dictionary attacks.
Usage: `./smbclientbrute user.txt psw.txt host`

In user.txt and psw.txt put ***one entry per line.***




If not working.....
>Try harder

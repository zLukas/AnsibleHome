#! /bin/bash

echo "checking ssh service..."
if [ $(systemctl status ssh | echo $?)  != 0 ]
then
    echo "ssh service not found, installing..." 
    apt-get install openssh-server -y
    systemctl enable ssh --now
fi 

if [ $(systemctl status ssh | grep "Active: active (running)" | echo $?)  != 0 ]
then 
    echo "cannot start ssh service..."
    echo " service status: "
    systemctl status ssh
    exit 1
else
    echo "ssh service up and running" 
fi

SSH_KEY_PATH="${HOME}/.ssh"
mkdir -p ${SSH_KEY_PATH}

echo "Gathering keys..."
SSH_KEYS=($(find . -name *.pub ))

for KEY in "${SSH_KEYS[@]}"
do 
    echo "adding ${KEY} to authorized keys"
    cat ${KEY} >> ${SSH_KEY_PATH}/authorized_keys
done 
#! /bin/bash

mkdir -p .ssh

echo "Gathering keys..."
SSH_KEYS=($(find . -name *.pub ))


for KEY in "${SSH_KEYS[@]}"
do 
    echo "adding ${KEY} to authorized keys"
    cat ${KEY} >> .ssh/authorized_keys
done 
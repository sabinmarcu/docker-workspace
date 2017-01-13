#!/bin/bash

FILES=$(ls /keys | grep .pub | grep -v ^d)

for HOMEDIR in /root /home/docker; do
    echo "=> Adding SSH Keys to ${HOMEDIR}"
    mkdir -p ${HOMEDIR}/.ssh
    chmod go-rwx ${HOMEDIR}/.ssh
    if [ -e ${HOMEDIR}/.ssh/authorized_keys ]; then
        rm ${HOMEDIR}/.ssh/authorized_keys
    fi
    for FILE in $FILES; do
        echo "    -> Adding ${FILE}"
        cat /keys/$FILE >> ${HOMEDIR}/.ssh/authorized_keys
    done
    chmod go-rw ${HOMEDIR}/.ssh/authorized_keys
    echo "=> Done"
done

chown -R docker:docker /home/docker/.ssh

echo "========================================================================"
echo "You can now connect to this container via SSH using:"
echo ""
echo "    ssh -p <port> <user>@<host>"
echo ""
echo "Choose root (full access) or docker (limited user account) as <user>."
echo "========================================================================"

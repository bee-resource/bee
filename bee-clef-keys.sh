#!/usr/bin/env sh

_USER=$(whoami)
_GROUP=$(id -gn)
_HOME=$(eval echo ~$USER)
_DIR=/var/lib/bee-clef
_DATE=$(date +%s)

sudo sh -c "install -o ${_USER} -g ${_GROUP} ${_DIR}/keystore/$(sudo ls -1 ${_DIR}/keystore/ | head -1) ${_HOME}/bee-clef-key.json"
echo "Key exported to ${_HOME}/bee-clef-key.json"
if command -v xclip >/dev/null 2>&1; then
    sudo sh -c "cat ${_DIR}/password | xclip -selection c"
    echo "Password loaded into clipboard and ready to be pasted"
else
    sudo sh -c "install -o ${_USER} -g ${_GROUP} ${_DIR}/password ${_HOME}/bee-clef-password.txt"
    echo "Pass exported to ${_HOME}/bee-clef-password.txt"
fi

exit 0


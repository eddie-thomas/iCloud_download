#!/bin/bash

# Start vm
source .venv/bin/activate

DIR=""
EMAIL=""
EXPECTED_VM=""
PASS=""
VM="$(which python)"

# Correctly assume VM
if [[ $VM != $EXPECTED_VM ]]
then
    echo "Python environment is not correct!"
    exit 1
fi

# Install packages
pip install --upgrade pip
pip install -r ./requirements.txt

icloudpd --directory "$DIR" --username $EMAIL --password $PASS --delete-after-download &&
# For some reason `icloudpd` doesn't exit correctly.
icloudpd --version > /dev/null

# Close VM
deactivate &&

exit
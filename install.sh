#!/bin/sh

cecho() {
    INTENSITY=$1
    COLOR=$2
    STRING=$3

    echo "\e[${INTENSITY};${COLOR}m${STRING}\e[0m"
}

DBSRC="https://raw.githubusercontent.com/SevenEcks/LambdaMOO/master/LambdaCore-latest.db"
SERVERSRC="https://github.com/toddsundsted/stunt"

PREFIX=~/moo
DBDIR=${PREFIX}/db
SERVERDIR=${PREFIX}/server

if [ -s $DBDIR ] && [ -s $SERVERDIR ]; then
    cecho 0 31 "#nope - database and server found."
    cecho 0 31 "Use 'em or remove 'em and run again."
    exit 1
fi

cecho 1 34 "[+] \$DBDIR     = [${DBDIR}]."
cecho 1 34 "[+] \$SERVERDIR = [${SERVERDIR}]."

cecho 1 34 "[+] Creating directories..."
mkdir -p ${DBDIR}

cecho 1 34 "[+] Grabbing the database..."
curl ${DBSRC} -o ${DBDIR}/core.db

cecho 1 34 "[+] Grabbing the server..."
git clone ${SERVERSRC} ${SERVERDIR}

if [ -f "restart.sh" ]; then
    cecho 1 34 "[+] Overwriting `restart.sh` in [${SERVERDIR}]..."
    cp restart.sh ${SERVERDIR}
fi

cecho 1 34 "[+] Building the server..."
cd ${SERVERDIR} && ./configure && make

cecho 1 34 "[+] Cleaning up..."
make clean

cecho 1 34 "[+] We be all done here. Yessuh."

#!/usr/bin/env bash

startdir=$(pwd);

#find CERNLIB directory
if [ -z ${CERN} ]; then
  scriptdir=$(dirname $(readlink -f $0));
fi

cd ${scriptdir} && source setup.sh;
cd ${scriptdir} && make;

cd ${startdir};

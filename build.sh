#!/usr/bin/env bash

startdir=$(pwd);
scriptdir=$(dirname $(readlink -f $0));
source ${scriptdir}/setup.sh;
echo "--- building CERNLIB"
cd ${scriptdir} && make && echo "-- build complete."
cd ${startdir};

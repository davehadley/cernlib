#!/usr/bin/env bash

#find CERNLIB directory
if [ -z ${CERN} ]; then
  scriptdir=$(dirname $(readlink -f $0));
  CERN=${scriptdir}/cernlib_2005
fi

export CERN;
export CERN_LEVEL=2005
export CERN_ROOT=${CERN}/${CERN_LEVEL}
export PATH=$CERN_ROOT/bin:$PATH

#echo CERN_ROOT=$CERN_ROOT
#echo CERN_LEVEL=$CERN_LEVEL

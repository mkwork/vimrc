#!/bin/bash

export "PULSE_PROP_media.role"=phone
ulimit -Sv 4120000 && firefox $*
#ulimit -Sv 4120000 && LD_PRELOAD=libjemalloc.so firefox $*

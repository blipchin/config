#! /bin/bash
# Finds the "root" of the current project, where the CSCOPE db should be located

CUR_DIR=`pwd`
FOLDER_SEP=/
DEFAULT_CSCOPE_FILE=cscope.out
SRC_ROOT_DIR="${CUR_DIR%src*}"
CSCOPE_DB=$SRC_ROOT_DIR$FOLDER_SEP$DEFAULT_CSCOPE_FILE

if [ -e $CSCOPE_DB ] ; then
    export CSCOPE_DB
else
    echo "No cscope db found"
fi

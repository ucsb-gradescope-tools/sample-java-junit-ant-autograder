#!/bin/sh

# YOU SHOULD NOT NEED TO EDIT THIS FILE

. ./expected.sh

if [ "$#" -eq 1 ]; then
    SUBMISSION_SOURCE=`pwd`/$1
else
    SUBMISSION_SOURCE=/autograder/submission
fi

if [ -d $SUBMISSION_SOURCE ]; then  
   echo "Checking submission from $SUBMISSION_SOURCE"
else
   echo "ERROR: $SUBMISSION_SOURCE does not exist"
   exit
fi

copy_files_from_dir_if_it_exists () {
    if [ -d $1 ]; then
        cp -v -R $1/* .
    fi
}

for f in $EXPECTED_FILES; do
    if [ -f $SUBMISSION_SOURCE/$f ]; then
        cp -v $SUBMISSION_SOURCE/$f src
    else
        echo "WARNING: Expected file $f not found in $SUBMISSION_SOURCE"
    fi
done

./build.sh

java -cp build/:lib/* RunTests > results.json

if [ -d /autograder/results ]; then
    cp -v results.json /autograder/results/results.json
fi
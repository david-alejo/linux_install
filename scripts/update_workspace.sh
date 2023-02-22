#! /bin/bash
for d in */ ; do
    echo Entering in directory $d
    cd $d
    echo Command git pull
    git pull
    cd ..
    echo Exiting directory $d
    echo
done

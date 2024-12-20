#!/bin/bash

source ./functions.sh #2>/dev/null

echo " Check if the user is root "
if [ $(id -u) != "0" ]; then
    echo "Error: The user is not root "
    echo "Please run this script as root"
    exit 1
fi

product=$1
version=$2
revision=$3
dists=$4
input_archs=$5
build_flag=build
lsapi_version=8.1
#if [ $dists = "ALL" ]; then
#        echo " convert dists value "
#            dists="jammy bionic buster focal bullseye bookworm noble"
#        echo " the new value for dists is $dists "
#fi

if [ $input_archs = "ALL" ]; then
    echo " convert archs value "
    archs="amd64 arm64"
    echo " the new value for archs is $archs "
else
    archs=$input_archs
fi

check_input
set_paras
set_build_dir
prepare_source
pbuild_packages
echo "##################################################"
echo " The package building process has finished ! "
echo "##################################################"
echo "########### Build Result Content #################"

for dist in $dists; do
    ls -lR $BUILD_RESULT_DIR/$dist;
done

echo " ################# End of Result #################"
echo $(date)




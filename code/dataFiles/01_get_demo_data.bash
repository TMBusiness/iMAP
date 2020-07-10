#!/usr/bin/env bash


### Load the rawdata in the designated folders 
# * The pipeline comes with demo data for testing purposes.

mkdir iMAP/data \
    iMAP/data/raw

# Get Rawdata
wget https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-demo-rawdata.zip
unzip -oj iMAP-demo-rawdata.zip -d iMAP/data/raw/
rm -f iMAP-demo-rawdata.zip

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, something is wrong, download did not finish, exiting...,!" 1>&2
    exit 1
fi



# Get Metadata
mkdir iMAP/data/metadata
wget https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-demo-metadata.zip
unzip -oj iMAP-demo-metadata.zip -d iMAP/data/metadata/
rm -f iMAP-demo-metadata.zip

if [ "$?" != "0" ]; then
    echo "[Error] Sorry, some or all of the required metadata not found, exiting...,!" 1>&2
    exit 1
fi

# mv samplemetadata.tsv iMAP/data/metadata/samplemetadata.tsv
# mv samplemetadata_casestudy.tsv iMAP/data/metadata/samplemetadata_casestudy.tsv


# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, samplemetadata files not found, exiting...,!" 1>&2
#     exit 1
# fi

# mv qced.files iMAP/data/metadata/qced.files

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, qced.files not found, exiting...,!" 1>&2
#     exit 1
# fi

# mv manifest.txt iMAP/data/metadata/manifest.txt

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, manifest.txt not found, exiting...,!" 1>&2
#     exit 1
# fi


# mv var1.design iMAP/data/metadata/var1.design 

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, var1.design not found, exiting...,!" 1>&2
#     exit 1
# fi

# mv var2.design iMAP/data/metadata/var2.design

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, var2.design not found, exiting...,!" 1>&2
#     exit 1
# fi
# mv var3.design iMAP/data/metadata/var3.design 

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, var3.design not found, exiting...,!" 1>&2
#     exit 1
# fi

# mv var4.design iMAP/data/metadata/var4.design

# if [ "$?" != "0" ]; then
#     echo "[Error] Sorry, var4.design not found, exiting...,!" 1>&2
#     exit 1
# fi

#!/usr/bin/env bash

# Purpose: Copy demo data to metadata and raw folders

cp iMAP/resources/metadata/* iMAP/data/metadata/
cp iMAP/resources/qced.files iMAP/data/metadata/
cp iMAP/resources/manifest.txt iMAP/data/metadata/
unzip -oj iMAP/resources/bbmap.zip -d iMAP/code/
unzip -oj iMAP/resources/raw.zip -d iMAP/data/raw/
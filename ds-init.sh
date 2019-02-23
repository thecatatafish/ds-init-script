#!/bin/bash

set -e
ENV_NAME=venv
virtualenv $ENV_NAME
source ./$ENV_NAME/bin/activate
pip install -r requirements.txt
mkdir data notebooks src .utils

# Git init and setup
rm -rf .git
git init
echo "*.ipynb    filter=dropoutput_ipynb" >> .gitattributes
mv ./ipynb_drop_output.py .utils/ipynb_drop_output.py
chmod +x .utils/ipynb_drop_output.py

# Make git clean notebook output before commiting
git config core.attributesfile ~/.gitattributes
git config filter.dropoutput_ipynb.clean ./.utils/ipynb_drop_output.py
git config filter.dropoutput_ipynb.smudge cat

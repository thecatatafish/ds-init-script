echo "Enter project name:"
read project

cd ..
mkdir $project
cd $project
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
mkdir data notebooks src .utils

# Git init and setup
git init
echo "*.ipynb    filter=dropoutput_ipynb" >> .gitattributes
cp ../.gitignore .
cp ../ipynb_drop_output.py .utils/ipynb_drop_output.py
chmod +x .utils/ipynb_drop_output.py

# Make git clean notebook output before commiting
git config core.attributesfile ~/.gitattributes
git config filter.dropoutput_ipynb.clean ipynb_drop_output.py
git config filter.dropoutput_ipynb.smudge cat

virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
mkdir data src notebooks
git init
echo "*.ipynb    filter=dropoutput_ipynb" >> .gitattributes
 

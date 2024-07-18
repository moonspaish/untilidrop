if ! command -v python3.9 &> /dev/null
then
    echo "Python3.9 could not be found"
    exit
fi

# Create and activate virtual environment
python3.9 -m venv venv
source venv/bin/activate

# Upgrade pip to ensure we have the latest version
pip install --upgrade pip
pip install -r requirements.txt
python3.9 manage.py collectstatic --noinput
python3.9 manage.py migrate
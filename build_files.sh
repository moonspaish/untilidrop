
# Create and activate virtual environment
python3.9 -m venv venv
source venv/bin/activate

# Upgrade pip to ensure we have the latest version

# Install dependencies with increased verbosity
pip install -r requirements.txt --verbose

# Run Django commands
python3.9 manage.py collectstatic --noinput
python3.9 manage.py migrate

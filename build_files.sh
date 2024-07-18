
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate

# Upgrade pip to ensure we have the latest version

# Install dependencies with increased verbosity
pip install -r requirements.txt --verbose

# Run Django commands
python manage.py collectstatic --noinput
python manage.py migrate

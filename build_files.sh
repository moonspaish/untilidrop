
# Install dependencies with increased verbosity
python3.9 -m pip install -r requirements.txt --verbose

python3.9 manage.py makemigrations --noinput
python3.9 manage.py migrate --noinput
python3.9 manage.py collectstatic --noinput --clear


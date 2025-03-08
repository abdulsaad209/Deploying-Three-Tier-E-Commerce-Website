# Use official Python image
FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt /app/
RUN apt update && apt install python3-dev default-libmysqlclient-dev build-essential pkg-config -y
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files
COPY . /app/

# Collect Static Files
RUN python manage.py collectstatic --noinput

# Expose the application port
EXPOSE 8000

# Start the Django server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "shoppinglyx.wsgi:application"]


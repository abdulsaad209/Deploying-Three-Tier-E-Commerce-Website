# Use official Python image as base
FROM python:3.8.6

# Set environment variables
ENV PYTHONUNBUFFERED=1 
ENV ALLOWED_HOSTS = ['192.168.100.15']

# Set working directory inside the container
WORKDIR /app

# Copy the application code
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000

# Start Django application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "apka_apna_mall.wsgi:application"]

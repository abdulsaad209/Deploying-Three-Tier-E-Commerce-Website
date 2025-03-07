# Use an official Python image as the base
FROM python:3.8.6

# Set working directory inside the container
WORKDIR /application

# Copy only the necessary files first to leverage Docker caching
COPY requirements.txt /application
COPY . /application

RUN pip install --upgrade pip && pip install -r requirements.txt

RUN python manage.py makemigrations
RUN python manage.py migrate

ENTRYPOINT ["python"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]


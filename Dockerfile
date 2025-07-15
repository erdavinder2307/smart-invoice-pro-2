# Use the official lightweight Python image.
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy project
COPY . /code/

# Expose the port Flask is running on
EXPOSE 8000

# Run the application
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]

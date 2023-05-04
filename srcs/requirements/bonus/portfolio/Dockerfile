FROM python:3.9-slim-buster
RUN apt-get update && \
    apt-get install -y python3 python3-pip
RUN pip install Flask
COPY . .
EXPOSE 5000
CMD ["python3", "app.py"]

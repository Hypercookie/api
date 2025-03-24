FROM jrottenberg/ffmpeg:4.1-ubuntu
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt
COPY ./API.py API.py
ENTRYPOINT ["uvicorn", "API:app", "--host", "0.0.0.0", "--port", "80"]

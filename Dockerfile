FROM python:3.13
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./API.py /code/API.py
CMD ["fastapi", "run", "API.py", "--proxy-headers", "--port", "80"]
FROM tensorflow/tensorflow

# keep python from generating .pyc file in container
ENV PYTHONDONTWRITEBYTECODE = 1

# turn off buffering for easier container logging
ENV PYTHONNUNBUFFERED = 1

# install pip requirements
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app

EXPOSE 5000
CMD ["python","server.py"]
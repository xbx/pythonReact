FROM python:3.5-slim

RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
#	apt-get -y install vim && \
#	apt-get -y install nano && \
	    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /opt/requirements.txt

RUN pip install -r /opt/requirements.txt

COPY ./statics/ /statics/
COPY app.py /app/app.py
WORKDIR /statics/js

EXPOSE 8080

CMD ["python", "/app/app.py"]

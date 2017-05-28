FROM python:3.5-slim

RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
	apt-get -y install vim && \
	apt-get -y install nano && \
	    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /statics/js

VOLUME ["/statics/"]

WORKDIR /statics/js

COPY requirements.txt /opt/requirements.txt

RUN pip install -r /opt/requirements.txt

EXPOSE 8080

CMD ["python", "/statics/js/app.py"]


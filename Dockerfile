FROM <base image>                   |   python:3.6, ubuntu

RUN pip install flask

COPY . <path>                       |   /opt/

EXPOSE <Port-within-the-container>  |   8080

WORKDIR /opt

ENTRYPOINT [<Application-to-run>]   |   ["python", "app.py"]
FROM python:2-alpine
MAINTAINER PradipPatel
WORKDIR /usr/src/app
COPY dependency.txt ./
RUN pip install --no-cache-dir -r dependency.txt
COPY . .
CMD [ "python", "./alationwebcounterassignment.py" ]
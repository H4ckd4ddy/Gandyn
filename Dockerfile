FROM python:3

COPY . /gandyn
COPY entrypoint.sh /

RUN chmod +x entrypoint.sh

RUN python3 /gandyn/setup.py develop

ENTRYPOINT ["/entrypoint.sh"]
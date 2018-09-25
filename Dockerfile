FROM ghost:2.1.3
MAINTAINER Najar Ramsada (ramsadanajar@gmail.com)


RUN apt-get update && apt-get install -y --no-install-recommends python-dev python-pip git bash vim && apt-get clean
RUN pip install --upgrade pip==9.0.3
RUN	pip install buster

COPY /ghost-on-github-pages /tmp

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 2368
CMD ["node", "current/index.js"]
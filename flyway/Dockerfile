FROM maven:3.3.3-jdk-8

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ADD ./flyway-app /usr/src/app

CMD mvn flyway:migrate

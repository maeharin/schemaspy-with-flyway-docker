#!/bin/bash -eu

DOCKER_IP=$(docker-machine ip default)
eval $(docker env default)
docker-compose up -d

SCRIPT_DIR=$(cd $(dirname $0);pwd);

SCHEMASPY_JAR=$SCRIPT_DIR/jar/schemaSpy_5.0.0.jar
JDBC_DRIVER_PATH=$SCRIPT_DIR/jar/postgresql-9.4.1208.jar

DBTYPE="pgsql"
DBHOST=${DOCKER_IP}
DBPORT=5432
DBNAME="sample_db"
DBUSER="sample_app"
DBPASS="testtest"
DBSCHEMA="public"
OUTPUT_DIR="html"

java -jar $SCHEMASPY_JAR \
     -dp $JDBC_DRIVER_PATH \
     -t $DBTYPE \
     -host $DBHOST \
     -port $DBPORT \
     -db $DBNAME \
     -u $DBUSER \
     -p $DBPASS \
     -s $DBSCHEMA \
     -rails \
     -o $OUTPUT_DIR

docker-compose stop

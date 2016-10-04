FROM java:8-alpine

ENV YOUTRACK_VERSION 7.0.27505

RUN wget http://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.zip \
    && mkdir -p /opt/youtrack \
    && unzip youtrack-$YOUTRACK_VERSION.zip -d /opt/youtrack \
    && mv /opt/youtrack/youtrack-27477/* /opt/youtrack \
    && rm -d /opt/youtrack/youtrack-27477 \
    && rm youtrack-$YOUTRACK_VERSION.zip

VOLUME ["/opt/youtrack/conf", "/opt/youtrack/data", "/opt/youtrack/logs", "/opt/youtrack/backups"]

EXPOSE 8080

WORKDIR /opt/youtrack

ENTRYPOINT ["bin/youtrack.sh", "run"]

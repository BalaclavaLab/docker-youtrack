FROM java:8

ENV YOUTRACK_VERSION 6.0.12634

RUN wget http://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.zip \
    && unzip youtrack-$YOUTRACK_VERSION.zip -d /opt/youtrack \
    && rm youtrack-$YOUTRACK_VERSION.zip

VOLUME ["/opt/youtrack/conf", "/opt/youtrack/data", "/opt/youtrack/logs", "/opt/youtrack/backups"]

EXPOSE 8080

WORKDIR /opt/youtrack

ENTRYPOINT ["bin/youtrack.sh", "run"]

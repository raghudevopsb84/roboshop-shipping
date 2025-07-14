FROM              amazoncorretto:17
RUN               yum install shadow-utils unzip -y && useradd roboshop && mkdir /app && chown roboshop:roboshop /app
RUN               cd /usr/local && curl -L -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && unzip newrelic-java.zip && rm -f newrelic-java.zip
WORKDIR           /app
USER              roboshop
COPY              target/shipping-1.0.jar /app/shipping.jar
COPY              run.sh /app/run.sh
ENTRYPOINT        ["bash", "/app/run.sh"]

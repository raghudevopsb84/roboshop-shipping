FROM              amazoncorretto:17
RUN               cd /usr/local && curl -L -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && unzip newrelic-java.zip && rm -f newrelic-java.zip
RUN               yum install shadow-utils -y && useradd roboshop && mkdir /app && chown roboshop:roboshop /app
WORKDIR           /app
USER              roboshop
COPY              target/shipping-1.0.jar /app/shipping.jar
ENTRYPOINT        ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-XX:InitialRAMPercentage=80","-XX:MaxRAMPercentage=95", "-jar","/app/shipping.jar"]

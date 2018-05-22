FROM java:8-jre-alpine

ENV DATABASE_HOST product-services-db
ENV DATABASE_PORT 5432
ENV DATABASE_NAME dbcadastro
ENV DATABASE_USER postgres
ENV DATABASE_PASSWORD p4SSW0rd


VOLUME /tmp
ARG JAR_FILE
ARG PROFILE
ADD ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.profiles.active=container","/app.jar"]
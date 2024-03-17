# Use Maven image to build the war file
FROM maven:3.6.3-jdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use Tomcat official image to deploy the war
FROM tomcat:9-jdk11-openjdk-slim
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

# Use the official Tomcat 10.0.23 image as the base
FROM tomcat:10.0.23-jdk11

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps

# Copy MavenWebProject.war file into the webapps directory
COPY target/MavenWebProject.war .

# Expose port 8080 (Tomcat default port)
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]

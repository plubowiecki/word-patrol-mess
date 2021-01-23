FROM openjdk:8-jdk-alpine

# Set build directory
WORKDIR /app/codebase
RUN ls -l

#RUN apk info
RUN apk update
RUN apk --no-cache add maven
#RUN mvn -v

# Copy all the project codebase
ADD . ./
RUN ls -l

# Clean and build project
RUN mvn package

# Copy jar to app directory
RUN mv target/*.jar ../../app.jar

# Set run directory
WORKDIR /app

# Remove build directory
RUN rm -rf codebase

# Update created date
RUN touch app.jar

# Remove m2 repository
WORKDIR /root/.m2/
RUN rm -rf repository

# Define application name
ENV app_name "Word Patrol Mess"

# Expose default applications port
EXPOSE 8080

# Run application as a Java application
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

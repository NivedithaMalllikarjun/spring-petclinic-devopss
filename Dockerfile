# Use a lightweight OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file into the container
COPY target/*.jar app.jar

# Expose the port your app runs on
EXPOSE 9090

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=9090"]


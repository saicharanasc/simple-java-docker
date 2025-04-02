# 1st we needa a base image. Y we need a base image? Because we need a base image to build our image on top of it. so pull a base image which gives all required tools & libraries to run our application.
# Next this is related to java application, So u need Java jdk base image Use the official OpenJDK 17 image as the base image 
FROM openjdk:17-jdk-alpine 

# Set the working directory in the container to /app
# Copy the local jar file to the container's /app directory
# this will create a folder in the continer called app and copy the jar file to that folder
WORKDIR /app 

# Copy everthing from my host machine to the container's /app directory
# this will copy everything from the current directory which is host to the container's /app directory
# we can also use COPY src/main.java /app/main.java to copy only the main.java file to the container's /app directory
COPY . .


#Whenever we want to run something in the container, we need to use the RUN command.
# This command will run the maven wrapper script to build the project and create a jar file
# javac is the java compiler, it will compile the java code and create a class file and main.java is the main class file 
RUN javac src/main.java

#run the application using the java command
# this will run the main class file and start the application 

CMD ["java", "Main"]






# differnce between CMD and RUN command in dockerfile 
# RUN command is used to build the image and create a layer in the image. It is used to run commands during the build process of the image.
# CMD command is used to run the container and start the application. It is used to run commands when the container is started from the image.
# CMD command can be overridden by passing a different command when starting the container.





#  Unit17-Container-Deployment

## Introduction

Software for commercial use, such as apps and corporate programs, need to be deployed where users can easily access it. This often requires web access and deployment to servers in the cloud. General issues about deployment are too advanced to be covered here. This unit discusses containers, a technology for packaging programs for deployment to the cloud.

A container is a self-contained environment that includes all of the things that an app needs to run. Placing a simple program into a container is relatively easy using Docker [1], one of the most popular container technologies. Keep in mind that more complicated apps will likely require correspondingly more complicated setup, possibly including multiple containers and some technology to network them together.

## Use Case

This unit illustrates how to take a simple program and containerize it using Docker. Both Java and Python examples are shown. A more complicated web server application is also shown.

## Prompts and Code Critique

### Example 17.1 prompt: Containerize the SimpleCalculator.java program in Java 17.

```
// SimpleCalculator.java
public class SimpleCalculator {

    public int add(int a, int b) {
        return a + b;
    }

    public int subtract(int a, int b) {
        return a - b;
    }

    public int multiply(int a, int b) {
        return a * b;
    }

    public double divide(int a, int b) {
        if (b == 0) {
            throw new IllegalArgumentException("Division by zero is not allowed.");
        }
        return (double) a / b;
    }

    public static void main(String[] args) {
        SimpleCalculator calculator = new SimpleCalculator();
        System.out.println("1 + 2 = " + calculator.add(1, 2));
        System.out.println("1 - 2 = " + calculator.subtract(1, 2));
        System.out.println("1 * 2 = " + calculator.multiply(1, 2));
        System.out.println("1 / 2 = " + calculator.divide(1, 2));
    }
}
```

### Generated Guidance:

To containerize the Java program, you need to create a Dockerfile that specifies how to build a Docker image for your application. Here are the steps:

1. **Create a Dockerfile**: This file will contain the instructions to build the Docker image.
2. **Specify the base image**: Use an official Java runtime image or Python interpreter.
3. **Copy the application code**: Copy your source code into the Docker image.
4. **Compile the application**: Compile the code inside the Docker image.
5. **Specify the entry point**: Define the command to run your application.

Here is a step-by-step Copilot prompts for a Java project SimpleCalculator:

**Step-by-Step Plan**

1. **Create a Dockerfile** in the root directory of your project.
2. **Specify the base image**: Use an official Java image, e.g., `openjdk:11`.
3. **Set the working directory**: Use `WORKDIR` to set the working directory inside the container.
4. **Copy the source code**: Use `COPY` to copy your Java source files into the container.
5. **Compile the Java code**: Use `RUN` to compile the Java code using `javac`.
6. **Specify the entry point**: Use `CMD` to specify the command to run your application.

```
// Dockerfile
# Use an official OpenJDK runtime as a parent image
FROM openjdk:11

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Compile the Java code
RUN javac SimpleCalculator.java

# Run the application
CMD ["java", "SimpleCalculator"]
```

**Build and Run the Docker Container**

1. **Build the Docker image**:

   ``````
   docker build -t simple-calculator .
   ``````

2. **Run the Docker container**:

   ``````
   docker run simple-calculator
   ``````

This Dockerfile assumes that `SimpleCalculator.java` is a standalone application with a `main` method. If your `SimpleCalculator` class is part of a larger application, you may need to adjust the Dockerfile accordingly.

### Critique

This prompt can generate detailed guidance on how to containerize a simple Java program. It also generates the Dockerfile and terminal commands used to containerize the program. The Dockerfile and commands work well. Rating: Good.

### Example 17.2 prompt: Containerize the calculator program in Python 3.12.

```
// calculator.py
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        raise ValueError("Can't divide by zero!")
    return a / b

def main():
    while True:
        try:
            a = float(input("Enter a number: "))
            b = float(input("Enter another number: "))
            break
        except ValueError:
            print("Invalid input. Please enter a number.")

    print("Select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")

    while True:
        choice = input("Enter choice (1/2/3/4): ")

        if choice in ('1', '2', '3', '4'):
            if choice == '1':
                print(f"{a} + {b} = {add(a, b)}")
            elif choice == '2':
                print(f"{a} - {b} = {subtract(a, b)}")
            elif choice == '3':
                print(f"{a} * {b} = {multiply(a, b)}")
            elif choice == '4':
                try:
                    print(f"{a} / {b} = {divide(a, b)}")
                except ValueError as e:
                    print(e)
            break
        else:
            print("Invalid input. Please enter 1, 2, 3, or 4.")

if __name__ == '__main__':
    main()
```

### Generated Guidance:

To pack this Python program into a Docker container, follow these steps:

1. **Create a Dockerfile**: This file contains instructions for Docker on how to build your image.
2. **Build the Docker Image**: Use the Docker CLI to build an image from your Dockerfile.
3. **Run the Docker Container**: Start a container from your image.

**Step 1: Create a Dockerfile**

- **Base Image**: Start with a Python 3.12 base image.
- **Working Directory**: Set a working directory inside your container.
- **Copy Files**: Copy your Python script into the container.
- **Run Command**: Specify the command to run your script.

```
// Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Run calculator.py when the container launches
CMD ["python", "./calculator.py"]
```

**Step 2: Build the Docker Image**

Open your terminal and navigate to the directory containing your Python script and Dockerfile. Then, run the following command to build your Docker image. Replace `your_image_name` with a name for your image.

```
docker build -t your_image_name .
```

**Step 3: Run the Docker Container**

After building the image, run your container using the following command. Replace `your_image_name` with the name you used when building your image.

``````
docker run -it your_image_name
``````

This command runs your Python script inside a Docker container based on the image you built. The `-it` flags allocate a pseudo-TTY connected to the container’s stdin; allowing for interactive use of the application.

Ensure Docker is installed and running on your machine before executing these commands.

### Critique

This prompt also generates detailed steps and guidance for containerizing, along with a Dockerfile and commands. After testing, the provided instructions successfully package the program. Rating: Good.

For the next example, we will put the SimpleCalculator.java in a Maven project and test how Copilot works with Maven.

### Example 17.3 prompt: Based on the pom.xml file, containerize this maven project.

```
// pom.xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.example</groupId>
  <artifactId>demo</artifactId>
  <version>1.0-SNAPSHOT</version>

  <name>demo</name>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
  </properties>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>
  </dependencies>

  <build>
    <pluginManagement><!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
      <plugins>
        <!-- clean lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#clean_Lifecycle -->
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
        <!-- default lifecycle, jar packaging: see https://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_jar_packaging -->
        <plugin>
          <artifactId>maven-resources-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.8.0</version>
        </plugin>
        <plugin>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>2.22.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-jar-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-install-plugin</artifactId>
          <version>2.5.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-deploy-plugin</artifactId>
          <version>2.8.2</version>
        </plugin>
        <!-- site lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#site_Lifecycle -->
        <plugin>
          <artifactId>maven-site-plugin</artifactId>
          <version>3.7.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-project-info-reports-plugin</artifactId>
          <version>3.0.0</version>
        </plugin>
      </plugins>
    </pluginManagement>
  </build>
</project>
```

### Generated Guidance:

To containerize a Maven project, you need to create a Dockerfile that specifies how to build the Docker image for your application. Here are the steps:

1. **Create a Dockerfile** in the root directory of your project.
2. **Write the Dockerfile** to use a Maven image to build the project and then use a JDK image to run the application.

Here is the detailed plan in pseudocode:

1. Use an official Maven image to build the project.
2. Copy the project files into the Docker image.
3. Run `mvn clean package` to build the project.
4. Use an official JDK image to run the application.
5. Copy the built JAR file from the Maven image to the JDK image.
6. Specify the command to run the JAR file.

Now, let's write the Dockerfile:

```
// Dockerfile
# Use Maven image to build the project
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package

# Use JDK image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the Maven image
COPY --from=build /app/target/demo-1.0-SNAPSHOT.jar ./demo.jar

# Specify the command to run the application
CMD ["java", "-jar", "demo.jar"]
```

To build and run the Docker image:

1. **Build the Docker image**:

   ``````
   docker build -t demo-app .
   ``````

2. **Run the Docker container**:

   ``````
   docker run -p 8080:8080 demo-app
   ``````

This will build your Maven project inside a Docker container and then run the resulting JAR file in another container. Make sure your application is configured to run on port 8080 or adjust the port mapping as needed.

### Critique

This prompt makes Copilot consider Maven as the build tool, so it includes Maven build commands in the Dockerfile and inherits from Maven’s Dockerfile. However, after building the container, the result shows that this process could not correctly build a container. Running the program resulted in the error ‘no main manifest attribute, in app.jar,’ indicating that the container lacks a main class identifier in the pom.xml file and cannot run correctly. Copilot did not resolve this issue. Rating: Poor.

### Example 17.4 prompt: Fix the "no main manifest attribute" problem and containerize this maven project.

### Generated Guidance:

To fix the "no main manifest attribute" problem and containerize the Maven project, follow these steps:

1. **Add the `maven-jar-plugin` to the `pom.xml` to specify the main class.**
2. **Create a Dockerfile to containerize the application.**

**Step 1: Update `pom.xml`**

Add the `maven-jar-plugin` configuration to specify the main class. This will ensure that the JAR file has the main manifest attribute.

```
// Update about pom.xml
<build>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-jar-plugin</artifactId>
      <version>3.2.0</version>
      <configuration>
        <archive>
          <manifest>
            <mainClass>com.example.MainClass</mainClass> <!-- Replace with your main class -->
          </manifest>
        </archive>
      </configuration>
    </plugin>
  </plugins>
</build>
```

**Step 2: Create a Dockerfile**

Create a `Dockerfile` in the root directory of your project to containerize the application.

```
// Dockerfile
# Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/demo-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**Step 3: Build and Run the Docker Container**

1. **Build the Docker image:**

   ``````
   docker build -t demo-app .
   ``````

2. **Run the Docker container:**

   ``````
   docker run -p 8080:8080 demo-app
   ``````

This will package your application into a JAR file with the main manifest attribute and containerize it using Docker.

### Critique

After manually adding the error message and telling Copilot to fix the error, Copilot generates an update for the pom.xml file. The test shows that the Maven program could be containerized correctly. Rating: Good.

### Example 17.5 prompt: Containerize this web application when using TomEE Plus 9.1.2

### Generated Guidance:

To containerize a web application using TomEE Plus 9.1.2, follow these steps:

1. **Create a Dockerfile**: This file will contain instructions to build the Docker image for your application.
2. **Base Image**: Start with a base image that has TomEE Plus 9.1.2 installed or use a generic Java image and install TomEE Plus manually.
3. **Add Application**: Copy your built `.war` file into the appropriate directory within the container so that TomEE can deploy it.
4. **Expose Port**: Expose the port that TomEE uses (typically 8080) so that the application can be accessed from outside the container.
5. **Run TomEE**: Define the command to start TomEE Plus.

Here's a step-by-step breakdown in pseudocode:

```
// Dockerfile
# Use an official TomEE Plus base image
FROM tomee:9.1.2-plus

# Set the working directory in the container
WORKDIR /usr/local/tomee/webapps

# Copy the built war file into the webapps directory of TomEE
COPY ./target/myapp.war .

# Expose port 8080 to the outside world
EXPOSE 8080

# Start TomEE Plus
CMD ["catalina.sh", "run"]
```

Replace `myapp.war` with the name of your WAR file. This Dockerfile assumes that you have a WAR file built from your Maven project (`./target/myapp.war`). You may need to adjust paths based on your project's structure.

To build and run your Docker container:

1. **Build the Docker Image**: Run `docker build -t myapp:latest .` in the directory containing your Dockerfile.
2. **Run the Container**: Execute `docker run -d -p 8080:8080 myapp:latest` to start your application.

This will make your application accessible at `http://localhost:8080`.

### Critique

The guidance provided by Copilot is clear and detailed. The test shows that following the steps provided by Copilot can successfully containerize a web application. However, before packaging, it is necessary to manually package the .war file in the Maven plugin, for which detailed instructions were not provided. Rating: Good.

### Example 17.6 prompt: From now on, I would like you to ask me questions to containerize a web application. When you have enough information to containerize it, create the dockerfile and tell me the step to containerize it.

### Generated Content:

To assist you effectively in containerizing your web application, I'll need to gather some information. Here are the questions:

1. What programming language and version is your web application written in?
2. What framework (if any) is your web application using, and what version?
3. Does your application require a specific version of a web server (e.g., Apache, Nginx)?
4. What are the operating system dependencies, if any?
5. Does your application connect to a database? If yes, what database (e.g., MySQL, PostgreSQL), and do you plan to run the database in the same container or separately?
6. Are there any other services your application depends on (e.g., Redis, RabbitMQ)?
7. What ports does your application need to expose?
8. Do you have any specific requirements for the base image (e.g., Alpine Linux for a smaller image size)?
9. How do you currently build and run your application locally?
10. Are there any environment variables or configuration files that need to be included or modified for the application to run in a container environment?
11. Do you need to include any specific files or directories from your project into the Docker image?
12. Will your application need to write to the filesystem, and if so, do you need to persist this data?
13. Is there a continuous integration/continuous deployment (CI/CD) pipeline in place that you would like to integrate the containerization process into?

### Answer prompt: 1. it is written in Java and uses Java17 as JDK. 2. The application is based on the basic HTML and web servlet framework. 3. My web application is running on TomEE Plus 9.1.2 7. The port is 8080 9. I am using Maven to build the project and run it on the TomEE server. The answer to the other question is no.

### Generated Guidance:

Based on the information provided, here's a Dockerfile to containerize your Java web application running on TomEE Plus 9.1.2, exposing port 8080, and built with Maven:

```Dockerfile
# Use the official Maven image to build the project
FROM maven:3.8.4-openjdk-17 as builder

# Copy the project files to the container
COPY . /usr/src/app

# Set the working directory
WORKDIR /usr/src/app

# Build the project
RUN mvn clean package

# Use TomEE Plus as the base image for the final image
FROM tomee:9.1.2-plus

# Copy the WAR file from the builder stage to the TomEE webapps directory
COPY --from=builder /usr/src/app/target/helloworld-1.0-SNAPSHOT.war /usr/local/tomee/webapps/helloworld.war

# Expose the port the app runs on
EXPOSE 8080

# Start TomEE
CMD ["catalina.sh", "run"]
```

**Steps to Containerize Your Web Application**

1. **Create the Dockerfile**: Save the above Dockerfile in the root directory of your project.

2. **Build the Docker Image**:
   Open a terminal and navigate to the root directory of your project. Run the following command to build your Docker image:

   ```sh
   docker build -t helloworld:latest .
   ```
   This command builds a Docker image named `helloworld` with the `latest` tag, using the Dockerfile in the current directory.

3. **Run Your Container**:
   After the image is built, you can run your application in a container using:
   ```sh
   docker run -d -p 8080:8080 helloworld:latest
   ```
   This command runs your Docker container in detached mode, mapping port 8080 of the container to port 8080 on your host, allowing you to access your application at `http://localhost:8080`.

4. **Verify the Application**:
   Open a web browser and navigate to `http://localhost:8080` to ensure your application is running correctly.

These steps will containerize your Java web application, making it easy to deploy and run in any environment that supports Docker.

### Critique

Based on this prompt, the guidance provided by Copilot is very comprehensive and clear. We just need to follow the instructions provided by Copilot to complete the containerizing. There is no need to learn how to package the .war file in the Maven plugin because the command is already included in the Dockerfile. Rating: Good.

## Exercises

1. In Example 17.1, try to write a program that can take a JSON string from an online API key and use Copilot to containerize it to see if it can still communicate with the API key.
2. In Example 17.4, try to write a server program that uses TCP protocol, listens to port 12345, and prints all the messages from the client. Use Copilot to containerize the server and make it listen to port 6789.

## References
[1] https://www.docker.com/

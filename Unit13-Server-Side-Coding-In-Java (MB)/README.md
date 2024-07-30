#  Unit13-Server-Side-Coding-In-Java
## Introduction

Unit 12 discussed the client-server style for connecting programs on different computers. If you have not yet worked on that unit, please do so before this one.

A server in Java uses a protocol (typically TPC or UDP), a port number, and some method for transmitting data (often strings, but more complicated data is possible). The server application must be started before the client that wants to connect to it, so that there's a "target" for the client to point to. Once the server is running, it typically waits for input to be send from the client. In general, this is a request from the client for the server to perform some operation, like looking up data to be returned to the client.

In this unit, there are several server examples that use variations on the basic setup.

## Use Case
Suppose that an organization has a database of customer information. A server could provide the interface for looking up items in the database. Suppose the client sends a customer id number (used as the key for the customer information). The server looks up the id in the database and returns the customer information back to the client. This separation of concerns simplifies the client code and allows one server to keep track of the customer database, rather than every client having its own copy of the entire database.

## Prompts and Code Critique

### Example 13.1 prompt: Write a server that uses UDP protocol listen to port 6789 and echo back whatever message it receives. Also, users can stop the server by sending the message "q".

### Generated Code:

```
import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UDPEchoServer {
    public static void main(String[] args) {
        final int port = 6789;
        byte[] buffer = new byte[1024];

        try (DatagramSocket socket = new DatagramSocket(port)) {
            System.out.println("Server is listening on port " + port);

            while (true) {
                DatagramPacket request = new DatagramPacket(buffer, buffer.length);
                socket.receive(request); // Receive packet from client

                String received = new String(request.getData(), 0, request.getLength());
                System.out.println("Received: " + received);

                // Check if the received message is "q", then stop the server
                if ("q".equals(received.trim())) {
                    System.out.println("Server is shutting down.");
                    break;
                }

                // Echo back the received message
                DatagramPacket response = new DatagramPacket(
                        request.getData(),
                        request.getLength(),
                        request.getAddress(),
                        request.getPort());

                socket.send(response);
            }
        } catch (Exception e) {
            System.out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
```

### Critique

This prompt provides a complete version of an Echo Server, which is able to correctly communicate with the written Echo Client, correctly display messages sent from the client side, and properly exit. The prompt specified the protocol (UDP) and the port number (6789) for the server; these settings must be set the same way in the client code. Note the user of the DatagramSocket when setting up the server - this is the Java UDP class. Similarly, a DatagramPacket is used to receive the client request. Rating: Good.

### Example 13.2 prompt: Write a server that can do simple calculations for the client, including add, abstract, multiply, and divide. The server will store the calculation result and return the result after the calculation. The server can continuously receive multiple calculation requests from clients.

### Generated Code:

```
import java.io.*;
import java.net.*;

public class CalculationServer {
    public static void main(String[] args) throws IOException {
        int port = 1234; // Server port
        ServerSocket serverSocket = new ServerSocket(port);
        System.out.println("Server started. Listening on port " + port);

        while (true) {
            try (Socket clientSocket = serverSocket.accept();
                 PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                 BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))) {
                System.out.println("Client connected");

                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    String[] parts = inputLine.split(" ");
                    if (parts.length == 3) {
                        try {
                            double operand1 = Double.parseDouble(parts[1]);
                            double operand2 = Double.parseDouble(parts[2]);
                            double result = 0;

                            switch (parts[0].toLowerCase()) {
                                case "add":
                                    result = operand1 + operand2;
                                    break;
                                case "subtract":
                                    result = operand1 - operand2;
                                    break;
                                case "multiply":
                                    result = operand1 * operand2;
                                    break;
                                case "divide":
                                    if (operand2 == 0) throw new ArithmeticException("Cannot divide by zero.");
                                    result = operand1 / operand2;
                                    break;
                                default:
                                    out.println("Error: Invalid operation.");
                                    continue;
                            }

                            out.println("Result: " + result);
                        } catch (NumberFormatException e) {
                            out.println("Error: Invalid number format.");
                        } catch (ArithmeticException e) {
                            out.println("Error: " + e.getMessage());
                        }
                    } else {
                        out.println("Error: Invalid request format.");
                    }
                }
            } catch (IOException e) {
                System.out.println("Exception caught when trying to listen on port " + port + " or listening for a connection");
                System.out.println(e.getMessage());
            }
        }
    }
}
```

### Critique

This prompt provides a server code that can correctly communicate with the client by providing more in the message - the operator and the two operands. It also handles incorrect operators and addresses the case of division by zero. Rating: Good.

### Example 13.3 prompt: Generate a Complex class that can do simple complex number calculations which will be used for a server that can do simple complex number calculations for the client. Also, based on the Complex class, write a server that can do simple complex number calculations for the client, including add, abstract, multiply, and divide. The server will store the calculation result and return the result after the calculation. The server can continuously receive multiple calculation requests from clients.

### Generated Code:

```
// Complex.java
public class Complex {
    private double real;
    private double imaginary;

    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    public Complex multiply(Complex other) {
        double newReal = this.real * other.real - this.imaginary * other.imaginary;
        double newImaginary = this.real * other.imaginary + this.imaginary * other.real;
        return new Complex(newReal, newImaginary);
    }

    public Complex divide(Complex other) {
        Complex conjugate = new Complex(other.real, -other.imaginary);
        Complex numerator = this.multiply(conjugate);
        double denominator = other.real * other.real + other.imaginary * other.imaginary;
        return new Complex(numerator.real / denominator, numerator.imaginary / denominator);
    }

    @Override
    public String toString() {
        return String.format("(%f, %f)", real, imaginary);
    }
}
```

```
// Server.java
import java.io.*;
import java.net.*;
import java.util.StringTokenizer;

public class Server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(5000);
        System.out.println("Server started. Listening on port 5000...");

        try (Socket clientSocket = serverSocket.accept();
             PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
             BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                StringTokenizer st = new StringTokenizer(inputLine);
                String operation = st.nextToken();
                double real1 = Double.parseDouble(st.nextToken());
                double imag1 = Double.parseDouble(st.nextToken());
                double real2 = Double.parseDouble(st.nextToken());
                double imag2 = Double.parseDouble(st.nextToken());
                Complex result = null;

                Complex c1 = new Complex(real1, imag1);
                Complex c2 = new Complex(real2, imag2);

                switch (operation) {
                    case "add":
                        result = c1.add(c2);
                        break;
                    case "subtract":
                        result = c1.subtract(c2);
                        break;
                    case "multiply":
                        result = c1.multiply(c2);
                        break;
                    case "divide":
                        result = c1.divide(c2);
                        break;
                }

                if (result != null) {
                    out.println("Result: " + result);
                } else {
                    out.println("Invalid operation");
                }
            }
        } catch (IOException e) {
            System.out.println("Exception caught when trying to listen on port 5000 or listening for a connection");
            System.out.println(e.getMessage());
        }
    }
}
```

### Critique

Copilot handled the request that generated two separate classes well, providing a Complex class for computations and a dedicated Server class for communicating with the client. The program runs well, but it can't handle the invalid numeric inputs from clients. Moreover,  in some situations, there might be instances where the port number provided by Copilot is already in use. Simply changing the port number in the code can solve this problem. Rating: Fair.

### Example 13.4 prompt: Generate a Complex class that can do simple complex number calculations which will be used for a server that can do simple complex number calculations for the client. The Complex object will be able to be transferred between a server and a client. Also, based on the Complex class, write a server that can do simple complex number calculation for the client, including add, abstract, multiply, and divide. The server will be able to receive an Complex object to client and store the calculation result and return the result after the calculation. The server can continuously receives multiple calculation request from client.

### Generated Code:

```
// Complex.java
import java.io.Serializable;

public class Complex implements Serializable {
    private double real;
    private double imaginary;

    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    public Complex multiply(Complex other) {
        double newReal = this.real * other.real - this.imaginary * other.imaginary;
        double newImaginary = this.real * other.imaginary + this.imaginary * other.real;
        return new Complex(newReal, newImaginary);
    }

    public Complex divide(Complex other) {
        Complex conjugate = new Complex(other.real, -other.imaginary);
        Complex numerator = this.multiply(conjugate);
        double denominator = other.real * other.real + other.imaginary * other.imaginary;
        return new Complex(numerator.real / denominator, numerator.imaginary / denominator);
    }

    @Override
    public String toString() {
        return String.format("%f + %fi", real, imaginary);
    }
}
```

```
// ComplexServer.java
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ComplexServer {
    public static void main(String[] args) throws Exception {
        ServerSocket serverSocket = new ServerSocket(12345);
        System.out.println("Server started. Listening on port 12345.");

        while (true) {
            try (Socket clientSocket = serverSocket.accept();
                 ObjectInputStream ois = new ObjectInputStream(clientSocket.getInputStream());
                 ObjectOutputStream oos = new ObjectOutputStream(clientSocket.getOutputStream())) {

                String operation = ois.readUTF();
                Complex c1 = (Complex) ois.readObject();
                Complex c2 = (Complex) ois.readObject();
                Complex result = null;

                switch (operation) {
                    case "add":
                        result = c1.add(c2);
                        break;
                    case "subtract":
                        result = c1.subtract(c2);
                        break;
                    case "multiply":
                        result = c1.multiply(c2);
                        break;
                    case "divide":
                        result = c1.divide(c2);
                        break;
                }

                oos.writeObject(result);
                oos.flush();
            } catch (Exception e) {
                System.err.println("Error handling client: " + e.getMessage());
            }
        }
    }
}
```

### Critique

Copilot generate a Complex class that implements the Serializable interface, allowing this class to be properly transferred between the server and client in binary format. This is more efficient than transmitting the operator and the operand as strings. Note the use of ObjectInputStream and ObjectOutputStream to wrap the input and output streams - this is the binary part. However, the server code still cannot handle incorrect client input and provide error messages to the client, but that could be handled on the client side.

## Exercises

1. In Example 13.1, change the prompt to ask Copilot to generate a server using TCP protocol and change all the lowercase letters in the messages from the client to uppercase letters.
2. In Example 13.2, ask Copilot to generate a server that can handle matrix calculation.
3. In Example 13.3 and 13.4, change the prompt to handle the invalid numeric input problem.

## References

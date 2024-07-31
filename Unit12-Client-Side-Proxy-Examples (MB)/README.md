#  Unit12-Client-Side-Proxy-Examples
## Introduction

Client-server programming is one style used to connect two computers. In basic client-server, the client asks the server a question - compute some value, look up some data - and the server responds with the answer. After the client sends the question, it typically waits for the answer before proceeding. There may be many clients using the same server - for example, many users of a smartphone app would use the same server. The server should be able to handle multiple client requests simultaneously instead of one connection at a time. There are many examples on the web for how to do all this including [1].

Variations on this style exist, but in this unit, we will only look at simple clients first, then at clients that separate out the communication part of the code to a **proxy** - that is, a method or class that encapsulates the communication details so that the main part of the program only deals with the data handling, not the data transmission.

Other details that client-server code include the protocol used (TCP, UDP, or some higher-level protocol), the port number that the server is listening to, and the kind of data being transmitted (simple string data or something more complicated). The examples below will use the simplest values of each.

A client cannot work without a corresponding server. See Unit13 for examples of server code.

## Use Case

Suppose we have a simple smartphone app that queries a weather server for the current temperature. The app's job is simply to request those values and then display them once they have been received. The server's jobs is to send the current temperature back to the client.

This simple client-server interaction uses text data for the temperature, which the client will convert to a floating point number. The details of the data usage and the data transmission can be different, as they are (very simply) here. For more complicated data, the server could package the data as JSON (see Unit08), XML (see Unit10), or in CSV format (see Unit 11).

## Prompts and Code Critique

The first example starts small - the client simply sends the word "temperature" to the server and waits for the reply and displays it. Unit13 illustrates how to generate server code. For this example, to keep things simple, we'll assume that the server exists and is correct. Note that the prompt specifies TCP as the protocol, uses port 6789, and uses simple string data.

### Example 12.1 Generate a simple client in Java using TCP on port 6789 that sends the message "temperature" to a server. The server should return "70". The client should receive that and print it.

```
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class SimpleClient {
    public static void main(String[] args) {
        String serverAddress = "localhost"; // Change this to the server's address if needed
        int port = 6789;
        String message = "temperature";

        try (Socket socket = new Socket(serverAddress, port);
             OutputStream outputStream = socket.getOutputStream();
             PrintWriter writer = new PrintWriter(outputStream, true);
             BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

            // Send the message to the server
            writer.println(message);
            System.out.println("Message sent to the server: " + message);

            // Receive the response from the server
            String response = reader.readLine();
            System.out.println("Response from the server: " + response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

### Critique

The generated code uses the Socket class that implements the TCP protocol. It assumes the server is running locally (the server address is "localhost") since we did not specify otherwise. The writing and reading to/from the Socket is wrapped using a PrintWriter and a BufferedReader to make that part easy. Rating: Good.

### Example 12.2 Generate a simple client in Java using TCP on port 6789 that sends the message "temperature" to a server. The server should return "70". The client should receive that and print it. Then the client should prompt the user "More?"; if the user replies "Yes", then the client should repeat the request; if the user responds with anything else, end the client.

```
public class SimpleClient {
    public static void main(String[] args) {
        String serverAddress = "localhost"; // Change this to the server's address if needed
        int port = 6789;
        String message = "temperature";
        Scanner scanner = new Scanner(System.in);

        try {
            while (true) {
                try (Socket socket = new Socket(serverAddress, port);
                     OutputStream outputStream = socket.getOutputStream();
                     PrintWriter writer = new PrintWriter(outputStream, true);
                     BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

                    // Send the message to the server
                    writer.println(message);
                    System.out.println("Message sent to the server: " + message);

                    // Receive the response from the server
                    String response = reader.readLine();
                    System.out.println("Response from the server: " + response);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // Prompt the user for more input
                System.out.print("More? ");
                String userInput = scanner.nextLine();
                if (!userInput.equalsIgnoreCase("Yes")) {
                    break;
                }
            }
        } finally {
            scanner.close();
        }
    }
```

### Critique
The client code is now a bit more complicated, adding a loop to send additional requests to the server. Rating: Good.

### Example 12.3 Refactor SimpleClient using the Proxy pattern to isolate the communication code in a separate method.

```
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class ServerProxy {
    private String serverAddress;
    private int port;

    public ServerProxy(String serverAddress, int port) {
        this.serverAddress = serverAddress;
        this.port = port;
    }

    public String sendMessage(String message) {
        try (Socket socket = new Socket(serverAddress, port);
             OutputStream outputStream = socket.getOutputStream();
             PrintWriter writer = new PrintWriter(outputStream, true);
             BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

            // Send the message to the server
            writer.println(message);
            System.out.println("Message sent to the server: " + message);

            // Receive the response from the server
            return reader.readLine();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class SimpleClient {
    public static void main(String[] args) {
        String serverAddress = "localhost"; // Change this to the server's address if needed
        int port = 6789;
        String message = "temperature";
        Scanner scanner = new Scanner(System.in);

        ServerProxy serverProxy = new ServerProxy(serverAddress, port);

        try {
            while (true) {
                // Use ServerProxy to send the message and receive the response
                String response = serverProxy.sendMessage(message);
                System.out.println("Response from the server: " + response);

                // Prompt the user for more input
                System.out.print("More? ");
                String userInput = scanner.nextLine();
                if (!userInput.equalsIgnoreCase("Yes")) {
                    break;
                }
            }
        } finally {
            scanner.close();
        }
    }
}
```

### Critique
Copilot went a step further than what the prompt requested: it created a new class, ServerProxy, that contains the method ***sendMessage()*** that encapsulates the communication code (the class constructor simply sets the address and port number). Now the SimpleClient code is simplified: its job is to interact with the user; it delegates the communication to the ServerProxy class, which it instantiates before using. Rating: Good.

## Exercises
1. Write a client for the Point class from Unit06. The client should prompt the user for the two points; the server will return the distance between those points, which the client should display.

2. Write a client that implements the user interface for the calculator program from Unit06. The client should prompt the user for the operation and the operands and send that, as a string, to the server, then display the answer returned by the server. (See Unit13 for the corresponding server example.)

## References
[1] https://docs.oracle.com/cd/F49540_01/DOC/inter.815/a67296/im_examp.htm

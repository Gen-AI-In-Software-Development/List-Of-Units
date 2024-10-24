
# Unit05-Generating-Documentation-From-Code-And-Code-From-Documentation
## Introduction

These examples use Microsoft copilot provided here: [Microsoft copilot](https://copilot.microsoft.com/).

## Use Case

We often write code and need to add documentation. In other cases, we might want to write documentation first and have Copilot generate the code.

In this unit, we explore these two use cases.

## Prompts and Code Critique

We will show each prompt and the response generated by Copilot. We will follow each example with a short critique and rating. The ratings will be Poor, Fair, or Good.

### Example 5.1 prompt: We have the following JavaScript code and would like it to be documented. Our hope is that the documentation will allow a new developer to quickly come up to steam and be able to modify the code. We want the documentation to be placed within the source code.
```
// server.js
const express = require('express');
const http = require('http');
const WebSocket = require('ws');

const port = 6969;
const server = http.createServer(express);
const wss = new WebSocket.Server({ server })

wss.on('connection', function connection(ws) {
  console.log("Connection established");
  ws.on('message', function incoming(data) {
    wss.clients.forEach(function each(client) {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(data.toString());
      }
    })
  })
})

server.listen(port, function() {
  console.log(`Server is listening on ${port}!`)
})
```

### Copilot's response:
```
// server.js

// Import the necessary modules
const express = require('express'); // Express framework for handling HTTP requests
const http = require('http'); // Node.js HTTP module to create the server
const WebSocket = require('ws'); // WebSocket module for real-time communication

// Define the port number for the server to listen on
const port = 6969;

// Create an HTTP server using the Express framework
const server = http.createServer(express);

// Create a WebSocket server that shares the same HTTP server
const wss = new WebSocket.Server({ server });

// Event listener for new WebSocket connections
wss.on('connection', function connection(ws) {
  console.log("Connection established"); // Log when a new connection is established

  // Event listener for incoming messages from clients
  ws.on('message', function incoming(data) {
    // Broadcast the received message to all connected clients except the sender
    wss.clients.forEach(function each(client) {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(data.toString()); // Send the message to the client
      }
    });
  });
});

// Start the HTTP server and listen on the specified port
server.listen(port, function() {
  console.log(`Server is listening on ${port}!`); // Log when the server starts listening
});

```

### Critique
This is very well done. Copilot explained that messages are not sent back to the message sender. In addition, the two event listeners handle different event types and Copilot explained this well. Rating: Good.

### Example 5.2 prompt: Please generate a complete Java program from the following documentation:

// Overall description: Two users would like to play Tic Tac Toe[1] against each other.

// Method documentation follows:

// Post-condition: An empty X and O board is displayed on the console

void showBoard()


// Pre-condition: An X and O board is provided as input.

// Post-condition: The board is modified with a new X at a new row and column.

void getXMoveFromUser(char board[][])

// Pre-condition: An X and O board is provided as input.

// Post-condition: The board is modified with a new O at a new row and column.

void getOMoveFromUser(char board[][])

// Post-condition: returns true if X is a winner

boolean x-is-a-winner(char board[])

// Post-condition: returns true if O is a winner

boolean o-is-a-winner(char board[])


// main routine

// interact with a user and allow the user to select moves.

// the x moves always move first.

// Stop when we have a winner

public void main()

```
import java.util.Scanner;

public class TicTacToe {

    public static void main(String[] args) {
        char[][] board = new char;
        initializeBoard(board);
        showBoard(board);

        while (true) {
            getXMoveFromUser(board);
            showBoard(board);
            if (xIsAWinner(board)) {
                System.out.println("X is the winner!");
                break;
            }
            if (isBoardFull(board)) {
                System.out.println("It's a draw!");
                break;
            }

            getOMoveFromUser(board);
            showBoard(board);
            if (oIsAWinner(board)) {
                System.out.println("O is the winner!");
                break;
            }
            if (isBoardFull(board)) {
                System.out.println("It's a draw!");
                break;
            }
        }
    }

    // Initialize the board with empty spaces
    public static void initializeBoard(char[][] board) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[i].length; j++) {
                board[i][j] = ' ';
            }
        }
    }

    // Display the board
    public static void showBoard(char[][] board) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[i].length; j++) {
                System.out.print(board[i][j]);
                if (j < board[i].length - 1) System.out.print("|");
            }
            System.out.println();
            if (i < board.length - 1) System.out.println("-----");
        }
    }

    // Get X move from user
    public static void getXMoveFromUser(char[][] board) {
        Scanner scanner = new Scanner(System.in);
        int row, col;
        while (true) {
            System.out.print("Enter row and column for X (0, 1, or 2): ");
            row = scanner.nextInt();
            col = scanner.nextInt();
            if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == ' ') {
                board[row][col] = 'X';
                break;
            } else {
                System.out.println("Invalid move. Try again.");
            }
        }
    }

    // Get O move from user
    public static void getOMoveFromUser(char[][] board) {
        Scanner scanner = new Scanner(System.in);
        int row, col;
        while (true) {
            System.out.print("Enter row and column for O (0, 1, or 2): ");
            row = scanner.nextInt();
            col = scanner.nextInt();
            if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == ' ') {
                board[row][col] = 'O';
                break;
            } else {
                System.out.println("Invalid move. Try again.");
            }
        }
    }

    // Check if X is a winner
    public static boolean xIsAWinner(char[][] board) {
        return checkWinner(board, 'X');
    }

    // Check if O is a winner
    public static boolean oIsAWinner(char[][] board) {
        return checkWinner(board, 'O');
    }

    // Check if the board is full
    public static boolean isBoardFull(char[][] board) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[i].length; j++) {
                if (board[i][j] == ' ') {
                    return false;
                }
            }
        }
        return true;
    }

    // Check if a player has won
    public static boolean checkWinner(char[][] board, char player) {
        // Check rows and columns
        for (int i = 0; i < 3; i++) {
            if ((board[i] == player && board[i] == player && board[i] == player) ||
                    (board[i] == player && board[i] == player && board[i] == player)) {
                return true;
            }
        }
        // Check diagonals
        if ((board == player && board == player && board == player) ||
                (board == player && board == player && board == player)) {
            return true;
        }
        return false;
    }
}
```
### Critique
This appears to be on the right track. However, the compiler gives a syntax error on the line "char[][] board = new char;". In addition, the checkWinner
method contains this code when checking for a win on the diagonal:
```
if ((board == player && board == player && board == player) ||
                (board == player && board == player && board == player)) {
            return true;
        }
```

This is not correct Java code. The variable "board" is a two dimensional array and cannot be compared to a player of type char. The directions to the user are not clear. Rating: Poor

## Exercises
1. In your language of choice, can you get Copilot to generate a good TicTacToe program for two users from documentation?
2. Can you get Copilot to play as one of the competitors in an X and O game from documentation?

## References
[1] [Tic Tac Toe at Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe)

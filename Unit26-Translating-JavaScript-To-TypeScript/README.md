#  Unit23-Translating-JavaScript-To-TypeScript
## Introduction
In this unit, we’ll learn how to convert JavaScript code to TypeScript using Microsoft Copilot. We’ll review the TypeScript code to ensure it follows best practices and effectively uses TypeScript features.

These examples use Microsoft copilot provided here: [Microsoft copilot](https://copilot.microsoft.com/).

## Use Case
TypeScript is a superset of JavaScript that adds static typing and other features. It helps developers catch errors early, write more maintainable code, and improve overall code quality. TypeScript is especially useful for large projects and teams, as it enforces coding standards and reduces bugs.

TypeScript works well with existing JavaScript code, making it easy to adopt gradually. It integrates smoothly with frameworks like React, Angular, and Vue.js, and can be used for both client-side and server-side development with Node.js.

In this unit, we’ll show how to convert JavaScript examples to TypeScript, demonstrating key concepts and best practices. Our goal is to highlight TypeScript’s benefits and provide practical tips for using it in web development.


## Installing and Running TypeScript

### On macOS

#### 1. Install Node.js and npm

If you haven't installed Node.js and npm yet, you can do so using Homebrew:

```bash
brew install node
```

Alternatively, download the installer from the [Node.js website](https://nodejs.org/).

#### 2. Install TypeScript

Open Terminal and run:

```bash
npm install -g typescript
```

This installs TypeScript globally on your system.

#### 3. Verify Installation

Check if TypeScript is installed correctly by running:

```bash
tsc --version
```

#### 4. Create a TypeScript File

Create a new TypeScript file with a `.ts` extension. For example, create a file named `app.ts` with the following content:

```typescript
let message: string = "Hello, TypeScript!";
console.log(message);
```

#### 5. Compile the TypeScript File

In Terminal, navigate to the directory where `app.ts` is located and run:

```bash
tsc app.ts
```

This command compiles `app.ts` into a JavaScript file named `app.js`.

#### 6. Run the JavaScript File

Execute the generated JavaScript file with Node.js:

```bash
node app.js
```

You should see the output: `Hello, TypeScript!`.

### On Windows

#### 1. Install Node.js and npm

Download the Node.js installer from the [official website](https://nodejs.org/). Run the installer and follow the prompts to install Node.js and npm.

#### 2. Install TypeScript

Open Command Prompt or PowerShell and run:

```bash
npm install -g typescript
```

This installs TypeScript globally on your system.

#### 3. Verify Installation

Check if TypeScript is installed correctly by running:

```bash
tsc --version
```

#### 4. Create a TypeScript File

Create a new TypeScript file with a `.ts` extension. For example, create a file named `app.ts` with the following content:

```typescript
let message: string = "Hello, TypeScript!";
console.log(message);
```

#### 5. Compile the TypeScript File

In Command Prompt or PowerShell, navigate to the directory where `app.ts` is located and run:

```bash
tsc app.ts
```

This command compiles `app.ts` into a JavaScript file named `app.js`.

#### 6. Run the JavaScript File

Execute the generated JavaScript file with Node.js:

```bash
node app.js
```

You should see the output: `Hello, TypeScript!`.

## Prompts and Code Critique
In this unit, we will build upon the JavaScript examples we explored previously and convert them into TypeScript. Leveraging the capabilities of Microsoft Copilot, we will translate and enhance these examples to illustrate how TypeScript can improve code quality and maintainability.

### Prompt 24.1 : Write a Node.js program that uses console.log to print all the numbers from 1 to 100, with two exceptions. For numbers divisible by 3, print "Fizz" instead of the number, and for numbers divisible by 5 (and not 3), print "Buzz" instead.When you have that working, modify your program to print "FizzBuzz" for numbers that are divisible by both 3 and 5 (and still print "Fizz" or "Buzz" for numbers divisible by only one of those) [1].
### Generated JavaScript Code
```
for (let i = 1; i <= 100; i++) {
    let output = '';
    if (i % 3 === 0) output += 'Fizz';
    if (i % 5 === 0) output += 'Buzz';
    console.log(output || i);
}

```

Please convert the JavaScript to TypeScript.

### Generated TypeScript Code
```
for (let i: number = 1; i <= 100; i++) {
    let output: string = '';
    if (i % 3 === 0) output += 'Fizz';
    if (i % 5 === 0) output += 'Buzz';
    console.log(output || i);
}
```

### Critique
The code is well-structured and leverages TypeScript's type annotations effectively. In this TypeScript version, Copilot has added `: number` and `: string` to explicitly declare the types of the variables `i` and `output`, respectively. This can help with type checking during compile time and can prevent certain types of bugs. Overall, this is a good implementation.
Rating: Good

### Prompt 24.2 :Write a Node.js program that creates a string that represents an 8×8 grid, using newline characters to separate lines. At each position of the grid there is either a space or a "#" character. The characters should form a chessboard [2].

### Generated JavaScript Code
```
let size = 8;
let board = "";

for (let y = 0; y < size; y++) {
  for (let x = 0; x < size; x++) {
    if ((x + y) % 2 == 0) {
      board += " ";
    } else {
      board += "#";
    }
  }
  board += "\n";
}

console.log(board);

```

Please convert the JavaScript to TypeScript.

### Generated TypeScript Code
```
let size: number = 8;
let board: string = "";

for (let y: number = 0; y < size; y++) {
  for (let x: number = 0; x < size; x++) {
    if ((x + y) % 2 === 0) {
      board += " ";
    } else {
      board += "#";
    }
  }
  board += "\n";
}

console.log(board);

```

### Critique
The code effectively creates a chessboard pattern using nested loops and TypeScript's type annotations. In this TypeScript version, Copilot has added type annotations `: number` and `: string` to the variables `size`, `board`, `y`, and `x` to ensure they are used consistently throughout the program. TypeScript’s static type checking will help catch errors at compile time, making the code more robust. This is a solid implementation.

Rating: Good

### Prompt 24.3 :Bean counting You can get the Nth character, or letter, from a string by writing "string"[N]. The returned value will be a string containing only one character (for example, "b"). The first character has position 0, which causes the last one to be found at position string.length - 1. In other words, a two-character string has length 2, and its characters have positions 0 and 1. Write a function countBs that takes a string as its only argument and returns a number that indicates how many uppercase “B” characters there are in the string. Next, write a function called countChar that behaves like countBs, except it takes a second argument that indicates the character that is to be counted (rather than counting only uppercase “B” characters). Rewrite countBs to make use of this new function [3].

### Generated JavaScript Code
```
const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

// Define a function countChar that counts the number of occurrences of a specific character in a string
function countChar(str, char) {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    if (str[i] === char) {
      count++;
    }
  }
  return count;
}

// Define a function countBs that counts the number of uppercase "B" characters in a string
function countBs(str) {
  return countChar(str, 'B');
}

// Function to get user input and call countBs and countChar
function getUserInput() {
  readline.question('Enter a string: ', (userString) => {
    readline.question('Enter a character to count: ', (userChar) => {
      console.log(`The character "${userChar}" appears ${countChar(userString, userChar)} times in the string.`);
      console.log(`The letter "B" appears ${countBs(userString)} times in the string.`);
      readline.close();
    });
  });
}

// Call the function to start the program
getUserInput();

```

Please convert the JavaScript to TypeScript.

### Generated TypeScript Code
```
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Define a function countChar that counts the number of occurrences of a specific character in a string
function countChar(str: string, char: string): number {
  let count: number = 0;
  for (let i: number = 0; i < str.length; i++) {
    if (str[i] === char) {
      count++;
    }
  }
  return count;
}

// Define a function countBs that counts the number of uppercase "B" characters in a string
function countBs(str: string): number {
  return countChar(str, 'B');
}

// Function to get user input and call countBs and countChar
function getUserInput(): void {
  rl.question('Enter a string: ', (userString: string) => {
    rl.question('Enter a character to count: ', (userChar: string) => {
      console.log(`The character "${userChar}" appears ${countChar(userString, userChar)} times in the string.`);
      console.log(`The letter "B" appears ${countBs(userString)} times in the string.`);
      rl.close();
    });
  });
}

// Call the function to start the program
getUserInput();

```

### Critique
The code effectively reads user input and counts character occurrences, benefiting from TypeScript’s static type checking. In this TypeScript version, Copilot has replaced require with the TypeScript import statement, added type annotations : string and : number to the function parameters and variables and renamed the readline interface to rl to avoid naming conflicts with the imported module. This implementation is well-structured and robust.
Rating: Good



### Prompt 24.4 :Quoting style, Imagine you have written a story and used single quotation marks throughout to mark pieces of dialogue. Now you want to replace all the dialogue quotes with double quotes, while keeping the single quotes used in contractions like aren’t. Think of a pattern that distinguishes these two kinds of quote usage and craft a call to the replace method that does the proper replacement [4].

### Generated JavaScript Code
```
function replaceQuotes(text) {
  var replacedText = text.replace(/(^|\W)'|'(\W|$)/g, '$1"$2');
  return replacedText;
}

// Example usage:
var story = "She said, 'Hello, aren't you coming?' and then left.";
var updatedStory = replaceQuotes(story);
console.log(updatedStory);

```

Please convert the JavaScript to TypeScript.

### Generated TypeScript Code
```
function replaceQuotes(text: string): string {
  const replacedText: string = text.replace(/(^|\W)'|'(\W|$)/g, '$1"$2');
  return replacedText;
}

// Example usage:
const story: string = "She said, 'Hello, aren't you coming?' and then left.";
const updatedStory: string = replaceQuotes(story);
console.log(updatedStory);
```

### Critique
The code efficiently replaces single quotes with double quotes in a string using regular expressions. In this TypeScript version, Copilot has added type annotations `: string` to the `text`, `replacedText`, `story`, and `updatedStory` variables to ensure they are used consistently as strings throughout the program. This will help with type checking during compile time, enhancing code reliability.

Rating: Good


## Exercises
For all the following exercises use Copilot to write a JavaScript program and then convert it to Typescript.
1. A program is needed that generates a random password of a given length.
2. A program is needed that provides simple text-based Tic-Tac-Toe game for two players.
3. A function is needed that translates a string into Morse code.
4. A function is needed that performs binary search on a sorted array of integers.
5. A function is needed that checks if a given Sudoku board is valid.
6. A main routine is needed that interacts with a user to read a Sudoku board and call the function in exercise 5.
7. A program is needed that solves a standard Sudoku puzzle provided by a user.

## References

[1] Haverbeke, Marijn, *Eloquent JavaScript*, 3rd edn (San Francisco: No Starch Press, 2018), pp. 38, ISBN 978-1-59327-950-9.

[2] Haverbeke, Marijn, *Eloquent JavaScript*, 3rd edn (San Francisco: No Starch Press, 2018), pp. 38, ISBN 978-1-59327-950-9.

[3] Haverbeke, Marijn, *Eloquent JavaScript*, 3rd edn (San Francisco: No Starch Press, 2018), pp. 56, ISBN 978-1-59327-950-9.

[4] Haverbeke, Marijn, *Eloquent JavaScript*, 3rd edn (San Francisco: No Starch Press, 2018), pp. 165-166, ISBN 978-1-59327-950-9.

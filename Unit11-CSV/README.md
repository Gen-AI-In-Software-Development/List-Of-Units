#  Unit11-CSV

## Introduction

Comma separated values (CSV) files are plain text files containing tabular data.
Each line represents a row of the table and values are separated by commas.
These file types are quite common in industry and are often used for exporting and importing data between databases, spreadsheets, and other applications.

## Compelling Use Case
To increase productivity, we would like to use a tool that could generate code that provides simple access to CSV files. It might, for example, model each row of the file with an object of an appropriate class. And, it might model the entire file with an array of row objects.

The code should be readable and be easy to use for reading, writing, and processing data within the file. And, the code should be tailored to a particular file structure.

## Exercises
1. Ask Copilot to generate a sample file of 100 rows with fields that you describe. Such a file might be used for testing. How would you rate Copilot's performance? Poor, Fair, or Good.
2. Using the data file from exercise 1, use Copilot to generate code (in the language of your choice) that makes it a simple matter for a developer to program against the file. How would you rate the quality of the code? Poor, Fair, or Good.  
3. Given the following file, use Copilot to generate code (in the language of your choice) that provides a clean abstraction for a developer to use to read and process the file. [See this crime data in CSV format: Pittsburgh 1990-1999](https://www.andrew.cmu.edu/user/mm6/95-771/CrimeData/CrimeLatLonXY1990.csv).

How would you rate Copilot's performance? Poor, Fair, or Good.  

4. Suppose we want to leave the the file where it currently is. That is, we do not want to download the file to our local machine and read it from our local disk. Instead, we want to be able to use a web URL to access the file, programatically. Have Copilot generate code (in the language of your choice) that accesses the entire file from a URL and computes some interesting statistics. How would you rate the quality of Copilot's code? Poor, Fair, or Good.  

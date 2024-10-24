#  Unit16-Generating-SE-Artifacts-UML-and-Architecture-Diagrams
## Introduction

Various artifacts are generated in the production of code. Code snippets, documentation, unit tests, configuration files, database schemas, database migration scripts, design patterns, build scripts, user stories and use cases, and UML diagrams[1].

## Use Case

In this unit, we ask Copilot to generate a UML interaction diagram or sequence diagram showing a user logging into a system.
 
## Prompt 16.1 Please generate a UML interaction diagram showing the standard way users log onto and are authenticated by a system. The authentication service will be called AS.

## Generated Response From Copilot
```
User -> Login Page: login request
Login Page -> AS: credentials
AS -> Database: verify credentials
Database -> AS: verification result
AS -> Login Page: authentication result
Login Page -> User: login status
```
### Critique
Although this is a textual response, the interaction diagram is simple to read and quite correctly depicts the steps involved in the authentication process. Rating: Good.
## Exercises
1. Ask Copilot to generate another UML interaction diagram. This one will show a browser and a server. The server will be fetching content from a backend database. How do you rate Copilot's response? Poor, Fair, or Good?
2. Ask Copilot to generate another UML interaction diagram. This one will show a client writing data to a message bus. A server will be reading the content from the bus and responding, via the bus, to the client. How do you rate Copilot's response? Poor, Fair, or Good?
3. Kerberos is the system used at Carnegie Mellon for authentication and authorization of users. Ask Copilot to generate an interaction diagram showing Kerberos authenticating a user. How do you rate Copilot's response? Poor, Fair, or Good?
4. Another UML diagram is the class diagram. It depicts the relationship between classes. Suppose a Student class is extended by a GradStudent class. That is, A GradStudent "is a" Student. Can Copilot represent this relationship as a class diagram? How do you rate Copilot's response? Poor, Fair, or Good?

## References
[1] [UML Diagrams](https://www.uml-diagrams.org/uml-25-diagrams.html)

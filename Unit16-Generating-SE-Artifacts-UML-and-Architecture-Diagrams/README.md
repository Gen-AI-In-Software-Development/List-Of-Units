#  Unit16-Generating-SE-Artifacts-UML-and-Architecture-Diagrams
## Introduction

Various diagrams are generated in to help in the production of code. This can include database schemas, UML diagrams[1] of various kinds, and software architecture diagrams. By itself, Copilot does not produce full-fidelity diagrams, but it can create text versions that are reasonable.

## Use Case

In this unit, we ask Copilot to generate a UML diagrams that can assist a developer in coding an application. Normally, these diagrams are quite detailed and can be time-consuming to create. Here, we will generate text-based diagrams that are "close enough" to the real things.  

## Example 16.1 Please generate a UML interaction diagram showing the standard way users log onto and are authenticated by a system. The authentication service will be called AS.

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

The next example is not the normal usage for UML: given the code, produce the class diagram. It serves as a test of Copilot's ability to generate diagrams.

## Example 16.2 Draw a UML diagram that represents these classes:
```
public class StudentList {
   private ArrayList<Student> list;

}

public class Student {
   private String firstName, lastName;
   private int id;
}

public class School {
   StudentList s;
}
```

## Answer:
```
+-----------------+
|     Student     |
+-----------------+
| - firstName: String |
| - lastName: String  |
| - id: int           |
+-----------------+
| + getFirstName(): String |
| + getLastName(): String  |
| + getId(): int           |
| + setFirstName(String): void |
| + setLastName(String): void  |
| + setId(int): void           |
+-----------------+

+-----------------+
|   StudentList   |
+-----------------+
| - list: ArrayList<Student> |
+-----------------+
| + addStudent(Student): void |
| + removeStudent(Student): void |
| + getStudents(): ArrayList<Student> |
+-----------------+

+-----------------+
|     School      |
+-----------------+
| - s: StudentList |
+-----------------+
| + getStudentList(): StudentList |
| + setStudentList(StudentList): void |
+-----------------+
```

## Critique
The answer contains class boxes but does not show the relationship between the classes, a key component of UML diagrams. Rating: poor. Re-prompted with this: Redo the UML diagram to show the relationships between the classes.
```
+-----------------+
|     Student     |
+-----------------+
| - firstName: String |
| - lastName: String  |
| - id: int           |
+-----------------+
| + getFirstName(): String |
| + getLastName(): String  |
| + getId(): int           |
| + setFirstName(String): void |
| + setLastName(String): void  |
| + setId(int): void           |
+-----------------+

          ^
          |
          1
          |
+-----------------+
|   StudentList   |
+-----------------+
| - list: ArrayList<Student> |
+-----------------+
| + addStudent(Student): void |
| + removeStudent(Student): void |
| + getStudents(): ArrayList<Student> |
+-----------------+

          ^
          |
          1
          |
+-----------------+
|     School      |
+-----------------+
| - s: StudentList |
+-----------------+
| + getStudentList(): StudentList |
| + setStudentList(StudentList): void |
+-----------------+
```
Relationships

StudentList has a one-to-many relationship with Student (indicated by the 1 on the StudentList side and the * on the Student side).  School has a one-to-one relationship with StudentList (indicated by the 1 on both sides).

## Critique
The English explanation of the relationships is correct, but the 1-to-many relationship between StudentList and Student is not clear in the diagram. Rating: fair.

The next example, while still a small application, is a more realistic use of
UML: given a statement of requirements, generate a class diagram that models
those requirements.

## Example 16.3 Create a UML class diagram for this problem: This application will contain several kinds of notes. Each note will have different characteristics. A regular not will have a unique number and will contain the name of the sender and the body of the note. A memo is a note with the added fields “From” and “To”. A timed memo is a memo with the date of the notes’s creation. A polite timed memo is a timed memo that adds a greeting and a closing. The app will keep track of a collection of notes; any of the four kinds of notes may be added to this collection. The application's main program will allow the user to create notes, one at a time, until done.

## Answer:
```
+-------------------+
|       Note        |
+-------------------+
| - uniqueNumber: int |
| - senderName: String |
| - body: String       |
+-------------------+
| + getUniqueNumber(): int |
| + getSenderName(): String |
| + getBody(): String       |
| + setUniqueNumber(int): void |
| + setSenderName(String): void |
| + setBody(String): void       |
+-------------------+

          ^
          |
          |
+-------------------+
|       Memo        |
+-------------------+
| - from: String    |
| - to: String      |
+-------------------+
| + getFrom(): String |
| + getTo(): String   |
| + setFrom(String): void |
| + setTo(String): void   |
+-------------------+

          ^
          |
          |
+-------------------+
|    TimedMemo      |
+-------------------+
| - creationDate: Date |
+-------------------+
| + getCreationDate(): Date |
| + setCreationDate(Date): void |
+-------------------+

          ^
          |
          |
+-------------------+
| PoliteTimedMemo   |
+-------------------+
| - greeting: String |
| - closing: String  |
+-------------------+
| + getGreeting(): String |
| + getClosing(): String  |
| + setGreeting(String): void |
| + setClosing(String): void  |
+-------------------+

+-------------------+
|    NoteCollection |
+-------------------+
| - notes: List<Note> |
+-------------------+
| + addNote(Note): void |
| + getNotes(): List<Note> |
+-------------------+

+-------------------+
|    MainProgram    |
+-------------------+
| + main(String[]): void |
+-------------------+
```
Explanation

Note: Base class with uniqueNumber, senderName, and body.

Memo: Inherits from Note and adds from and to.

TimedMemo: Inherits from Memo and adds creationDate.

PoliteTimedMemo: Inherits from TimedMemo and adds greeting and closing.

NoteCollection: Manages a collection of Note objects.

MainProgram: Contains the main method to create notes.

Relationships

Inheritance: Memo inherits from Note, TimedMemo inherits from Memo, and PoliteTimedMemo inherits from TimedMemo.

Aggregation: NoteCollection contains a list of Note objects.

## Critique
Again, the class relationships are a little hazy in the diagram but explained in the text. Rating: good.

Software architecture is a more difficult domain than simple class diagrams.
Architectures often involve distributed systems and there are many patterns that
can be used to guide a design.

## Example 16.4: Create a software architecture for the following problem:

MeetUp! will be a social networking app designed specifically for college students.  It will help students meet other students based on their class schedules and on their typical walking paths. It will allow students to communicate with other students using the app, enriching the college experience by connecting students with similar interests. The app will be customized for each college campus.

To use MeetUp!, a student will download the app to their smart phone and complete the registration process to create an account; only currently registered students will be allowed to have accounts. The student will either enter his/her schedule manually or will allow that schedule to be downloaded from a university server. The map interface will display a campus map. The student will be able to enter points of interest on the map, including dorm location, parking location, bus stop location (depending on how the student gets to campus) – one of these must be entered – plus other campus destinations, such as the cafeteria, student union, stadium, or gym. The app will then generate walking directions and, depending on the campus, bus route directions for the student to get to the classes on his/her schedule.

Based on the student’s schedule and on the walking directions, the app will make suggestions for friend requests. Suggestions will be prioritized based on the amount of overlap between schedules and between walking paths and bus directions. These suggestions will be sent to the student, who can then decide whether to try to make the connection, delete the suggestion, or defer a decision. Both students must agree to a connection before they become friends.

Once a connection is made, a student will be able to send text messages to his/her contacts. Other types of message types will also be allowed: emojis, gifs, jpegs, other multimedia content, and live web links. Given the possibility of abuse, a student may request that a contact be blocked, removing that person from the student’s list of contacts; the reason for the request is optional. A student may also contact a system administrator at any time, for example to report problems with the app or with suggestions for improvements.

There will be a system administrator role with the following capabilities. A variety of system statistics will be available, such as the number of students using the system, the number of connections suggested, the number of connections made, the number of connections deleted, the number of connections deferred, the number of messages sent; both numeric and graphical displays of each will be show. A dashboard will be available to show live statistics of the current system usage. All block requests will be shown. Any serious reasons for block requests will be flagged for immediate action, such as threats of harm or sexual content. The admin will be able to block student accounts for these and other reasons.

## Answer

Software Architecture for MeetUp!

1. Client-Side Components

Mobile App (iOS/Android)

- Registration Module: Handles user registration and authentication.

- Schedule Management Module: Allows users to enter or download their class schedules.

- Map Interface Module: Displays the campus map and allows users to enter points of interest.

- Friend Suggestion Module: Displays friend suggestions based on schedule and walking paths.

- Messaging Module: Allows users to send text messages, emojis, gifs, jpegs, multimedia content, and live web links.

- Notification Module: Notifies users of friend requests, messages, and other updates.

- Settings Module: Allows users to manage their account settings, including blocking contacts and contacting system administrators.

2. Server-Side Components

Authentication Service

- Validates user credentials and manages user sessions.

User Management Service

- Manages user profiles, schedules, and points of interest.

Friend Suggestion Service

- Generates friend suggestions based on schedule and walking path overlap.

Messaging Service

- Handles sending and receiving of messages, including multimedia content.

Notification Service

- Manages notifications for friend requests, messages, and other updates.

Admin Dashboard Service

- Provides system statistics, live usage data, and handles block requests.

Reporting Service

- Allows users to report problems or suggest improvements.

3. Database

User Database

- Stores user profiles, schedules, points of interest, and friend connections.

Message Database

- Stores messages and multimedia content.

Admin Database

- Stores system statistics, block requests, and admin actions.

4. External Integrations

University Server Integration

- Allows downloading of class schedules from the university server.

Map Service Integration

- Provides campus maps and walking/bus route directions.

5. Security

Authentication and Authorization

- Ensures only registered students can create accounts and access the app.

Data Encryption

- Encrypts sensitive data in transit and at rest.

Content Moderation

- Flags and handles inappropriate content in messages and block requests.
```
+---------------------+       +---------------------+       +---------------------+
|     Mobile App      |       |     Server-Side     |       |      Database       |
|---------------------|       |---------------------|       |---------------------|
| - Registration      |<----->| - Authentication    |<----->| - User Database     |
| - Schedule Mgmt     |       | - User Management   |       | - Message Database  |
| - Map Interface     |       | - Friend Suggestion |       | - Admin Database    |
| - Friend Suggestion |       | - Messaging         |       +---------------------+
| - Messaging         |       | - Notification      |
| - Notification      |       | - Admin Dashboard   |
| - Settings          |       | - Reporting         |
+---------------------+       +---------------------+
        ^                           ^
        |                           |
        |                           |
        v                           v
+---------------------+       +---------------------+
| University Server   |       |     Map Service     |
+---------------------+       +---------------------+
```

## Critique
The proposed services are all correct. Rating: excellent.

## Exercises
1. Ask Copilot to generate another UML interaction diagram. This one will show a browser and a server. The server will be fetching content from a backend database. How do you rate Copilot's response? Poor, Fair, or Good?

2. Ask Copilot to generate another UML interaction diagram. This one will show a client writing data to a message bus. A server will be reading the content from the bus and responding, via the bus, to the client. How do you rate Copilot's response? Poor, Fair, or Good?

3. Kerberos is the system used at Carnegie Mellon for authentication and authorization of users. Ask Copilot to generate an interaction diagram showing Kerberos authenticating a user. How do you rate Copilot's response? Poor, Fair, or Good?

4. Suppose a Student class is extended by a GradStudent class. That is, A GradStudent "is a" Student. Can Copilot represent this relationship as a class diagram? How do you rate Copilot's response? Poor, Fair, or Good?

5. Ask Copilot to generate a software architecture for this rather long problem.

A new Citation Support System (CSS) is needed by a police department and court system to process citations/tickets (the two terms are interchangeable here) issued by the police.  Each police officer will use a handheld device (notepad, smart phone, or dedicated ticketing device) to create parking and traffic tickets and other citations. New types of devices will be supported without major modifications. A citation will list the name and address of the person(s) being cited, the date and time of the offense, the type of the offense, a text description of the offense, and the officer giving the ticket.  Once entered, a citation will be able to be viewed and updated by court officials using PC’s or terminals.  Updates tell what happens to the ticket in the court system: ticket is dismissed; fine is issued; ticket is adjudicated at a court hearing; and so on.  Any update to a ticket (including its creation) triggers an automatic notification to one or more court officials by updating their displays to show the new state of the ticket in a “to-do” list format. These updates must happen in a timely fashion. The person cited in the ticket will be able to file pleas, post fines, and file complaints about the ticket either using a web interface with a secure login. An authorized lawyer will also be able to view and update tickets.

CSS will need to support multiple types of citations.  Each will list the name and address of the person receiving the ticket, plus the date and time that the ticket was issued.  Parking tickets will list the make, model, and license number of the car.  Traffic violations will list that, plus the driver’s license id and the registration number of the car.  Drunk-in-public citations will list the source of the alcohol (if known) and the blood alcohol percentage. Unruly behavior will list the type of behavior – for example, a loud car stereo, or dogs barking at night – its severity, and the complainants. More serious problems require detailed reports that will be filed later. For example, assault or robbery have state and/or federal mandated reports that will be entered in CSS at a later time; at the time of the initial filing, only a preliminary citation will be file. These will then be routed to the officer who issued the citation for later processing, but it may also be routed to other police personnel – for example, to detectives who take over an investigation. Each ticket will have two basic processing methods: either immediate processing, where a court official must be notified immediately via text message, or regular processing, where the court official’s display is updated eventually.  Any of the citations can use either of the processing methods.  

Because a ticket can be any combination of citation type and processing type described above, an actual ticket requires construction before use.  A ticket can be displayed in short form (just basic information) or in long form (all fields, properly labeled and color coded) on either a handheld device, PC, or terminal.  

A ticket will contain the cited person’s name, address, telephone number, and optionally the driver’s license number; the date and time of the offense, its type, and a text description of the offense; the name, rank, and identification number of the officer giving the ticket; a unique identification number for the ticket. When the ticket is posted, CSS will list the name, position, department name, office number and building, and telephone number of the court official that the citation will be routed to, but the issuer can change who receives the citation, within legal and departmental limits enforced by CSS – for example, a detective should not receive “barking dog” citations. Because of the legal implications of all citations, everything must be logged, and tracing functionality must be provided for legal discovery.

City personnel in charge of CSS will manage the CSS workflow.  They will be able to add or move a citation from one person’s responsibility to another’s, add (but not delete) information on a citation, and view the status of any citation. Reporting features include a dashboard for near real-time status of the system, and monthly, quarterly, and yearly reports of things like the number of citations issued, in progress, and closed in the given time frame; average and median times to closure; citations not yet closed that fall outside some time range; number and type of citations issued by or handled by individuals, departments, and overall.

The system must meet state and federal standards for security, including but not limited to privacy concerns (for both cited individuals and city personnel), non-refutability, secure login, and authorization to perform various actions based on user roles.


## References
[1] [UML Diagrams](https://www.uml-diagrams.org/uml-25-diagrams.html)

#  Unit18-Refractor-Code-By-Introducing-Design-Patterns-Into-Existing-Code
## Introduction

In this unit, Copilot will be used to generate code for some standard design patterns in Java. A design pattern is a set of classes and objects that solve some common coding problem. Patterns are created by experience designers who have seen the common coding problem multiple times and have proposed a general solution so that other coders can follow the solution instead of coming up with their own.

Design patterns were introduced in 1987 in a paper by Kent Beck and Ward Cunningham, and were popularized by the book *Design Patterns: Elements of Reusable Object-Oriented Software* by Gamma et al. in 1994 (commonly known as the Gang of Four or GoF book). GoF contained 23 patterns in three categories: *creational*, describing how objects are created; *structural*, which describe the connections between classes and their objects; and *behavioral*, which describe how classes and their objects communicate with each other. Since then, hundreds of other patterns have been published. The original set continue to be well-known in the software engineering community.

## Use Case

The *Adapter Pattern* (also known as the Wrapper Pattern) is a structural pattern used to connect a client class that uses one set of method calls to a server class that contains a different set of method calls. The method names, parameter types, and ordering of the parameters may need to be changed. The Adapter makes these changes, acting like a translator, changing from one "language" - the client's calls to methods - to another "language" - the server's methods. The Adapater is instantiated in the client; it, in turn, instantiates the server, and then acts a s a middleman to transfer calls from client to server. In practice, Adapters are often required to wrap calls to legacy libraries that cannot be changed; the clients must "adapt" to one or more legacy libraries.

The structural *Proxy Pattern* is an intermediary between a client class and a server class that performs some actions that the server does not, or prefers not, implement. For example, a Proxy could implement logging of client method calls and server responses, relieving the server from that work. The Proxy uses the same method signatures as the server class.

The creational pattern *Factory Method Pattern* is used to decouple the creation of an object from the client. This is often used when the thing being created is part of an inheritance hierarchy; the Factory does the creation so that the details of the hierarchy are not known - and therefore decoupled from - the client.

## Prompts and Code Critique

The following class, Stats, contains several methods for computing some simple statistics for an array of double values.

```
public class Stats {
    private double[] data;
    private int size;

    public Stats() {
    }

    public void storeData(double[] data, int size) {
        this.data = data;
        this.size = size;
    }

    public double computeAverage() {
        if (size == 0) {
            return 0;
        }
        double sum = 0;
        for (int i = 0; i < size; i++) {
            sum += data[i];
        }
        return sum / size;
    }

    public double computeMedian() {
        if (size == 0) {
            return 0;
        }
        double[] sortedData = data.clone();
        java.util.Arrays.sort(sortedData);
        if (size % 2 == 0) {
            return (sortedData[size / 2 - 1] + sortedData[size / 2]) / 2;
        } else {
            return sortedData[size / 2];
        }
    }

    public double[] computeDiff() {
        double average = computeAverage();
        double[] diff = new double[size];
        for (int i = 0; i < size; i++) {
            diff[i] = average - data[i];
        }
        return diff;

    }
}
```

Now consider the following main program; the assumption here is that main wants to use methods named setData(), avg(), median(), and diff():
```
public class App {
    public static void main(String[] args) {
        double[] data = { 3.0, 7.2, 4.5, 6.3, 2.1 };
        Translator translator = new Translator();
        translator.setData(data);
        double average = translator.avg();
        double median = translator.median();
        double diff[] = translator.diff();
        System.out.println("Average: " + average);
        System.out.println("Median: " + median);
        for (double x : diff) {
            System.out.println("Diff: " + x);
        }
    }
}
```

### Example 18.1 prompt: Create an adapter class named Translator that adapts Stats to main

### Generated Code:
```
class Translator {
    private Stats stats;

    public Translator() {
        this.stats = new Stats();
    }

    public void setData(double[] data) {
        stats.storeData(data, data.length);
    }

    public double avg() {
        return stats.computeAverage();
    }

    public double median() {
        return stats.computeMedian();
    }

    public double[] diff() {
        return stats.computeDiff();
    }
}
```

### Critique

Class Translator contains the required methods; note that it instantiates an instance of the Stats class in order to pass on requests. Rating: excellent.

For the next example, the Student class hierarchy contains three classes: the parent Student and two child classes, Undergraduate and Masters.

```
public class Student {
    public Student() {}

    public void complain() {
        System.out.println("Generic student complaint.");
    }
}

public class Undergraduate extends Student{
    public Undergraduate() {
        super();
    }
    public void complain() {
        System.out.println("I need more beer!");
    }
}

public class Masters extends Student{
    public Masters() {
        super();
    }
    public void complain() {
        System.out.println("I need more time!");
    }
}
```

The main program prompts the user for a String indicating what kind of Student object to create. While this example is very simple, it shows how to hide the object creation from main.

```
Scanner scanner = new Scanner(System.in);
System.out.print("Enter type of student: ");
String type = scanner.nextLine();
Student student = StudentFactory.createStudent(type);
student.complain();
```

### Example 18.2 prompt: Create a class named StudentFactory that implements the Factory Method pattern to create an object for these three classes: (included the Student class hierarchy in the prompt).

### Generated code:
```

public class StudentFactory {
    public static Student createStudent(String type) {
        if (type.equalsIgnoreCase("undergraduate")) {
            return new Undergraduate();
        } else if (type.equalsIgnoreCase("masters")) {
            return new Masters();
        } else {
            return new Student();
        }
    }
}
```

### Critique
The StudentFactory class' method, createStudent(), implements the Factory Method Pattern correctly. Rating: excellent.

Copilot needed the three classes as part of the prompt. Without them, it made several mistakes in the code: misnaming the classes and adding an exception.

## Exercises
1. Ask Copilot to create a class named StatsProxy that implements the Proxy Pattern between main and Stats that logs every request to a file named "logfile.txt".
2. Ask Copilot to create a class named LogSingleton that implements the Singleton Pattern for the log file in #1. The Singleton pattern ensures that only one instances of the class is ever created by keeping a reference variable which is set and returned on the first request to create it, but simply returns the reference to the already-created object on subsequent requests. See [Singleton](https://en.wikipedia.org/wiki/Singleton_pattern) for more details.
3. Ask Copilot to use the Strategy pattern to solve the following problem. A LibraryPatron, shown below, is charged for overdue books by one of three methods: no charge (for preferred patrons), small charge (for normal patrons, say $1), and large charge (for bad patrons). The method LibraryPatron.printFine() will use the field Borrower to actually print the fine. See if Copilot can use this description to generate the required classes. If not, note that there should be three child classes of Borrower, one each for the three types of overdue charges; use more information for Copilot if required.
```
public class LibraryPatron {
  public LibraryPatron() {}
  private Borrower borrower;
  public void printFine() {}
}
```
See [Singleton](https://en.wikipedia.org/wiki/Strategy_pattern) for more details.

## References
1. Beck, Kent; Cunningham, Ward (September 1987). "Using Pattern Languages for Object-Oriented Program", OOPSLA '87 workshop on Specification and Design for Object-Oriented Programming.
2. Gamma, Erich; Helm, Richard; Johnson, Ralph; Vlissides, John (1994). **Design Patterns: Elements of Reusable Object-Oriented Software**, Addison-Wesley.

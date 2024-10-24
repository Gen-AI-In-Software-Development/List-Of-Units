# Unit06-junit-For Java
## Introduction

In this unit, we'll investigate the standard unit testing tool for Java, junit. The goal is to review test cases generated by Microsoft Copilot and provide feedback on the generated test cases.

## Use Case
Unit test cases for the methods a class have the form <input data, expected results, actual results> along with an indication whether the test case passed or failed. junit provides a way to create test cases by creating a separate test class containing one or more methods. When these methods are executed, junit provides a summary of which ones passed (with a green icon) and which ones failed (with a red icon), plus the actual results. These functions will contain one or more assert( ) statements that contain the input and expected output for the method under test.

Writing test cases by hand requires knowing the correct expected results (the right answer). For simple methods - say, "computeSquareRoot" - this is easy. For more complicated methods - say, "computeCorporateTaxes" - this will be complicated and likely involve many sub-steps. It is crucial to refactor a complicated class into smaller, simple methods that perform those sub-steps for easier testing.

It is also important to note what unit testing does *not* do. Applications are usually collections of classes. Testing each class individually, as unit testing does, does not test the interaction of classes that use each other to perform related work. Nor does it test the entire application, either for functionality, performance, ease of use, security, or other important aspects. Unit testing is just that: one unit at a time.

## Prompts and Code Critique

We will show each prompt and the resulting code generated by Copilot. We will follow each example with a short critique and rating. The ratings will be Poor, Fair, or Good.

**The SimpleCalculator** below implements elementary calculator functions with some integer values.

```
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
}
```

### Example 6.1 prompt: Generate the test code for the SimpleCalculator class.

### Generated Code:

```
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class SimpleCalculatorTest {

    @Test
    void testAdd() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
    }

    @Test
    void testSubtract() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(-1, calculator.subtract(2, 3), "2 - 3 should equal -1");
    }

    @Test
    void testMultiply() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(6, calculator.multiply(2, 3), "2 * 3 should equal 6");
    }

    @Test
    void testDivide() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(2.0, calculator.divide(6, 3), "6 / 3 should equal 2.0");
    }

    @Test
    void testDivideByZero() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertThrows(IllegalArgumentException.class, () -> calculator.divide(1, 0), "Division by zero should throw IllegalArgumentException");
    }
}
```

### Critique

This test case provides an elementary test example for each method in the class, and each test example only has one test data point. The test can pass but is too simple and needs a better prompt. Rating: Fair.

### Example 6.2 prompt: Generate the test code for the SimpleCalculator class with at least 3 test cases with some complex number for each method.

### Generated Code:

```
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class SimpleCalculatorTest {

    @Test
    void testAdd() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(30, calculator.add(10, 20), "10 + 20 should equal 30");
        assertEquals(-10, calculator.add(-20, 10), "-20 + 10 should equal -10");
        assertEquals(0, calculator.add(0, 0), "0 + 0 should equal 0");
    }

    @Test
    void testSubtract() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(-10, calculator.subtract(10, 20), "10 - 20 should equal -10");
        assertEquals(-30, calculator.subtract(-20, 10), "-20 - 10 should equal -30");
        assertEquals(0, calculator.subtract(0, 0), "0 - 0 should equal 0");
    }

    @Test
    void testMultiply() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(200, calculator.multiply(10, 20), "10 * 20 should equal 200");
        assertEquals(-200, calculator.multiply(-20, 10), "-20 * 10 should equal -200");
        assertEquals(0, calculator.multiply(0, 20), "0 * 20 should equal 0");
    }

    @Test
    void testDivide() {
        SimpleCalculator calculator = new SimpleCalculator();
        assertEquals(0.5, calculator.divide(10, 20), "10 / 20 should equal 0.5");
        assertEquals(-2, calculator.divide(-20, 10), "-20 / 10 should equal -2");
        assertThrows(IllegalArgumentException.class, () -> calculator.divide(10, 0), "Division by zero should throw IllegalArgumentException");
    }
}
```

### Critique

This test example provides more calculation samples and gives the correct answers. It also tests the case of division by zero. Overall, it provides a relatively better test example. Rating: Fair.

**The Point class** is just what we use in Unit 3 that can represent a point on the Euclidean plane and compute the distance between two points.

```
public class Point {
    private double x; // The x-coordinate of the point
    private double y; // The y-coordinate of the point

    /**
     * Constructs a new Point with the given x and y coordinates.
     *
     * @param x The x-coordinate.
     * @param y The y-coordinate.
     */
    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    /**
     * Gets the x-coordinate of the point.
     *
     * @return The x-coordinate.
     */
    public double getX() {
        return x;
    }

    /**
     * Gets the y-coordinate of the point.
     *
     * @return The y-coordinate.
     */
    public double getY() {
        return y;
    }

    /**
     * Computes the Euclidean distance between this point and another point.
     *
     * @param otherPoint Another Point object.
     * @return The distance between the two points.
     */
    public double distanceTo(Point otherPoint) {
        double dx = this.x - otherPoint.getX();
        double dy = this.y - otherPoint.getY();
        return Math.sqrt(dx * dx + dy * dy);
    }

    /**
     * Returns a string representation of the point.
     *
     * @return A string in the format "Point(x, y)".
     */
    @Override
    public String toString() {
        return "Point(" + x + ", " + y + ")";
    }
}

```

### Example 6.3 prompt: Generate the test class in JUnit5 for the Point class to test distanceTo method.

### Generated Code:

```
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class PointTest {

    @Test
    public void testDistanceTo() {
        // Setup
        Point point1 = new Point(0, 0);
        Point point2 = new Point(3, 4);

        // Expected distance using the Pythagorean theorem
        double expectedDistance = 5.0;

        // Execute
        double actualDistance = point1.distanceTo(point2);

        // Assert
        assertEquals(expectedDistance, actualDistance, 0.001, "The distance calculation should be correct.");
    }
}
```

### Critique

This test example provides very basic data for testing the distanceTo method. The test passed, but the test example is too simple and still needs a better prompt. Rating: Fair.

### Example 6.4 prompt: Generate the test class in JUnit5 for the Point class to test distanceTo method with 5 more different test cases and float number in the test case.

### Generated Code:

```
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class AdditionalPointTest {

    @Test
    public void testDistanceTo_ZeroAndPositiveFloat() {
        Point point1 = new Point(0.0f, 0.0f);
        Point point2 = new Point(1.5f, 2.5f);
        double expectedDistance = 2.9154759474226504;
        double actualDistance = point1.distanceTo(point2);
        assertEquals(expectedDistance, actualDistance, 0.001, "Distance calculation is incorrect for zero and positive float coordinates.");
    }

    @Test
    public void testDistanceTo_NegativeFloatCoordinates() {
        Point point1 = new Point(-1.5f, -2.5f);
        Point point2 = new Point(-3.5f, -4.5f);
        double expectedDistance = 2.8284271247461903;
        double actualDistance = point1.distanceTo(point2);
        assertEquals(expectedDistance, actualDistance, 0.001, "Distance calculation is incorrect for negative float coordinates.");
    }

    @Test
    public void testDistanceTo_MixedFloatCoordinates() {
        Point point1 = new Point(-1.2f, 2.4f);
        Point point2 = new Point(3.6f, -4.8f);
        double expectedDistance = 8.06225774829855;
        double actualDistance = point1.distanceTo(point2);
        assertEquals(expectedDistance, actualDistance, 0.001, "Distance calculation is incorrect for mixed float coordinates.");
    }

    @Test
    public void testDistanceTo_VeryClosePoints() {
        Point point1 = new Point(1.0001f, 1.0001f);
        Point point2 = new Point(1.0002f, 1.0002f);
        double expectedDistance = 0.0001414213562373095;
        double actualDistance = point1.distanceTo(point2);
        assertEquals(expectedDistance, actualDistance, 0.0001, "Distance calculation is incorrect for very close points.");
    }

    @Test
    public void testDistanceTo_LargeFloatCoordinates() {
        Point point1 = new Point(1000.5f, 2000.5f);
        Point point2 = new Point(3000.5f, 4000.5f);
        double expectedDistance = 2828.4271247461903;
        double actualDistance = point1.distanceTo(point2);
        assertEquals(expectedDistance, actualDistance, 0.001, "Distance calculation is incorrect for large float coordinates.");
    }
}
```

### Critique

This test case uses more data. The test case failed, however: the correct distance is 8.653323272714909, not 8.06225774829855. Rating: Poor.

This is an example of a Copilot failure.

### Example 6.5 prompt: Change the test point to (3.3, 4.4) and (6.6, 8.8) and rewrite the test code

### Generated Code:

```
@Test
public void testDistanceTo() {
    // Setup
    Point point1 = new Point(3.3, 4.4);
    Point point2 = new Point(6.6, 8.8);

    // Expected distance calculated manually or using an external tool
    double expectedDistance = 6.22254; // Approximate distance

    // Execute
    double actualDistance = point1.distanceTo(point2);

    // Assert
    assertEquals(expectedDistance, actualDistance, 0.001, "The distance calculation should be correct.");
}
```

### Critique

This test case uses the specific test data we provided. But again, the expected answer is incorrect: the distance is 5.5, not 6.22254. Rating: Poor.

**The StatsClass** below computes some simple statistics on a set of double values.

```package project1;
import java.util.Arrays;

public class StatsClass {
    public StatsClass() { }

    public static double computeMean(double[] data) {
        double mean = 0.0;
        double accumulator = 0.0;
        if (data.length == 0) {
            return mean;
        }
        for (int i = 0; i < data.length; i++) {
            accumulator += data[i];
        }
        mean = accumulator / data.length;
        return mean;
    }

    public static double computeMedian(double[] data) {
        double median = 0.0;
        double[] c = data.clone();
        int half = c.length / 2;
        Arrays.sort(c);
        if (c.length % 2 == 0) {
            median = (c[half - 1] + c[half]) / 2.0;
        } else {
            median = c[half];
        }
        return median;
    }

    public static double computeMode(double[] data) {
        double mode = 0.0;
        Map<Double, Integer> map = new HashMap<Double, Integer>();
        int max = 1;
        mode = data[0];
        int count = 0;
        for (int i = 0; i < data.length; i++) {
            if (map.get(data[i]) != null) {
                count = map.get(data[i]);
                count++;
                map.put(data[i], count);
                if (count > max) {
                    max = count;
                    mode = data[i];
                }
            } else {
                map.put(data[i], 1);
            }
        }
        return mode;
    }

    public static double computeVariance(double[] data) {
        double variance = 0.0;
        double accumulator = 0.0;
        double diff;
        double mean = computeMean(data);
        for (int i = 0; i < data.length; i++) {
            diff = data[i] - mean;
            accumulator += diff * diff;
        }
        variance = accumulator / (data.length - 1);
        return variance;
    }

    public static double computeStddev(double[] data) {
        return Math.sqrt(computeVariance(data));
    }
}
```
This class contains methods to compute the mean, median, mode, variance, and standard deviation of an array of double values.

### Example 6.6 prompt: Generate a test method for StatsClass computeMean. ###

### Generated Code: ###
```
@Test
public void testComputeMean() {
    double[] data = {1, 2, 3, 4, 5};
    assertEquals(3, StatsClass.computeMean(data), "The mean of the data should be the sum of all elements divided by the number of elements.");
}
```

### Critique ###
The test case uses a very simple data set, only five integers. The test passes. A better prompt is required. Rating: Fair.

### Example 6.7 prompt: Generate a test method for StatsClass computeMean with at least 50 decimal data items. ###

### Generated Code: ###
```
@Test
public void testComputeMeanWithLargeDataSet() {
    double[] largeData = {
        1.2, 3.4, 5.6, 7.8, 9.0, 2.1, 4.3, 6.5, 8.7, 0.9,
        1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 0.0,
        1.9, 2.8, 3.7, 4.6, 5.5, 6.4, 7.3, 8.2, 9.1, 0.2,
        1.3, 2.4, 3.5, 4.6, 5.7, 6.8, 7.9, 8.0, 9.1, 0.3,
        1.4, 2.5, 3.6, 4.7, 5.8, 6.9, 7.0, 8.1, 9.2, 0.4
    };
    assertEquals(5.15, StatsClass.computeMean(largeData), 0.01, "The mean of the large data set should be accurate within a tolerance.");
}
```
### Critique ###
This test case uses more data; each data item is a decimal with one place. The test case failed, however: the correct mean is 4.958, not 5.15. Rating: Poor

This is an example of a Copilot failure.

### Example 6.8 prompt: Generate a test method for StatsClass computeMean. ###

### Generated Code: ###
```
@Test
public void testComputeMedianWithOddNumberOfElements() {
    double[] oddData = {1, 3, 5, 7, 9};
    assertEquals(5, StatsClass.computeMedian(oddData), "The median of an odd number of elements should be the middle element.");
}

@Test
public void testComputeMedianWithEvenNumberOfElements() {
    double[] evenData = {1, 2, 3, 4, 5, 6};
    assertEquals(3.5, StatsClass.computeMedian(evenData), "The median of an even number of elements should be the average of the two middle elements.");
}
```

### Critique ###
As with the mean example, the generated test cases use very simple integer data. Rating: Fair.

### Example 6.9 prompt: Generate a test method for StatsClass computeMedian with at least 50 decimal data items. ###

### Generated Code: ###
```
@Test
public void testComputeMedianWithLargeDataSet() {
    double[] largeData = {
        1.2, 3.4, 5.6, 7.8, 9.0, 2.1, 4.3, 6.5, 8.7, 0.9,
        1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 0.0,
        1.9, 2.8, 3.7, 4.6, 5.5, 6.4, 7.3, 8.2, 9.1, 0.2,
        1.3, 2.4, 3.5, 4.6, 5.7, 6.8, 7.9, 8.0, 9.1, 0.3,
        1.4, 2.5, 3.6, 4.7, 5.8, 6.9, 7.0, 8.1, 9.2, 0.4
    };
    Arrays.sort(largeData); // Ensure the data is sorted before computing median
    assertEquals(5.5, StatsClass.computeMedian(largeData), "The median of the large data set should be the middle value after sorting.");
}
```
### Critique ###
As with the mean example, more (but still simple) data is used. But again, the expected answer is incorrect: the median is 5.1. Rating: Poor.

### Example 6.10 prompt: Generate a test method for StatsClass computeVariance ###

### Generated Code: ###
```
public void testComputeVariance() {
    double[] data = { 1.1, 8.3, 2.7, 3.5, 8.3 };
    double expectedVariance = 8.688;
    double actualVariance = StatsClass.computeVariance(data);
    Assertions.assertEquals(expectedVariance, actualVariance, 0.001, "The variance calculation is incorrect");
}
```
### Critique ###
The actual variance for this data is 11.072, not 8.688. Rating: Poor.

### Example 6.11 prompt: Generate a test method for StatsClass computeStddev ###

### Generated Code:

```
@Test
public void testComputeStddev() {
    double[] data = {1.1, 8.3, 2.7, 3.5, 8.3};
    double expectedStddev = Math.sqrt(8.688); // Assuming the variance from the previous test is correct
    double actualStddev = StatsClass.computeStddev(data);
    Assertions.assertEquals(expectedStddev, actualStddev, 0.001, "The standard deviation calculation is incorrect");
}
```
### Critique ###
The actual standard deviation is 2.327, not 8.688. Rating: Poor.

We will further investigate some basic data structures.

**The ArrayListWithIntegers class** below is the class that contains a basic Java data type: ArrayList. The code for ArrayListWithIntegers, using ArrayList<Integer>, is shown below. The code for ArrayListWithDoubles (see below for test cases) and ArrayListWithStrings (see the exercises) are not shown but are very similar.

```
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Hello world!
 *
 */
public class ArrayListWithIntegers {
    private ArrayList<Integer> list;

    public ArrayListWithIntegers() {
        list = new ArrayList<Integer>();
    }

    public void addElement(int element) {
        list.add(element);
    }

    public void removeElement(int element) {
        list.remove(Integer.valueOf(element));
    }

    public ArrayList<Integer> getList() {
        return list;
    }

    @Override
    public String toString() {
        return list.toString();
    }
}

```

The other two classes are the same besides changing Integer into Double or String.

### Example 6.12 prompt: Generate a test class of ArrayListWithIntegers in JUnit5 to test the add and remove method

### Generated Code:

```
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArrayListWithIntegersTest {

    private ArrayListWithIntegers arrayListWithIntegers;

    @BeforeEach
    public void setUp() {
        arrayListWithIntegers = new ArrayListWithIntegers();
    }

    @Test
    public void testAddElement() {
        arrayListWithIntegers.addElement(5);
        assertEquals(1, arrayListWithIntegers.getList().size(), "List size should be 1 after adding an element.");
        assertTrue(arrayListWithIntegers.getList().contains(5), "List should contain the added element.");
    }

    @Test
    public void testRemoveElement() {
        arrayListWithIntegers.addElement(10);
        arrayListWithIntegers.addElement(20);
        arrayListWithIntegers.removeElement(10);
        assertEquals(1, arrayListWithIntegers.getList().size(), "List size should be 1 after removing an element.");
        assertTrue(!arrayListWithIntegers.getList().contains(10), "List should not contain the removed element.");
    }
}
```

### Critique

This prompt generates simple test data for each method. The test passes, but the data is too simple. Rating: Fair.

### Example 6.13 prompt: Add more test cases to it.

### Generated Code:

```
@Test
public void testRemoveElementNotPresent() {
    arrayListWithIntegers.addElement(30);
    boolean result = arrayListWithIntegers.removeElement(40); // Assuming removeElement returns boolean
    assertEquals(1, arrayListWithIntegers.getList().size(), "List size should remain unchanged when removing a non-existent element.");
    assertFalse(result, "removeElement should return false when trying to remove a non-existent element.");
}

@Test
public void testAddMultipleElements() {
    arrayListWithIntegers.addElement(50);
    arrayListWithIntegers.addElement(60);
    assertEquals(2, arrayListWithIntegers.getList().size(), "List size should be 2 after adding two elements.");
    assertTrue(arrayListWithIntegers.getList().contains(50) && arrayListWithIntegers.getList().contains(60), "List should contain both added elements.");
}

@Test
public void testRemoveAllElements() {
    arrayListWithIntegers.addElement(70);
    arrayListWithIntegers.addElement(80);
    arrayListWithIntegers.removeElement(70);
    arrayListWithIntegers.removeElement(80);
    assertTrue(arrayListWithIntegers.getList().isEmpty(), "List should be empty after removing all elements.");
}
```

### Critique

This prompt generates more test data. However, the `testRemoveElementNotPresent` does not work because the original method's return type is `void`. Rating: Poor.

### Example 6.14 prompt: Generate a test class of ArrayListWithDouble in JUnit5 to test the add and remove method

The code for ArrayListWithDouble is not shown here. Create it by replacing "Integer" with "Double" in ArrayListWithInteger and rename the class.

### Generated Code:

```
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArrayListWithDoubleTest {

    private ArrayListWithDouble arrayListWithDouble;

    @BeforeEach
    public void setUp() {
        arrayListWithDouble = new ArrayListWithDouble();
    }

    @Test
    public void testAddElement() {
        arrayListWithDouble.addElement(5.0);
        ArrayList<Double> list = arrayListWithDouble.getList();
        assertEquals(1, list.size(), "List size should be 1 after adding an element.");
        assertEquals(5.0, list.get(0), "The added element should be 5.0.");
    }

    @Test
    public void testRemoveElement() {
        arrayListWithDouble.addElement(10.0);
        arrayListWithDouble.addElement(20.0);
        arrayListWithDouble.removeElement(10.0);
        ArrayList<Double> list = arrayListWithDouble.getList();
        assertEquals(1, list.size(), "List size should be 1 after removing an element.");
        assertTrue(list.contains(20.0), "List should contain 20.0.");
    }
}
```

### Critique

As ArrayList with Integer, copilot gives a simple test data for each method. Rating: Fair

### Example 6.15 prompt: Add more test cases to it.

### Generated Code:

```
@Test
public void testAddMultipleElements() {
    arrayListWithDouble.addElement(1.0);
    arrayListWithDouble.addElement(2.0);
    arrayListWithDouble.addElement(3.0);
    ArrayList<Double> list = arrayListWithDouble.getList();
    assertEquals(3, list.size(), "List size should be 3 after adding three elements.");
    assertEquals(1.0, list.get(0), "First element should be 1.0.");
    assertEquals(2.0, list.get(1), "Second element should be 2.0.");
    assertEquals(3.0, list.get(2), "Third element should be 3.0.");
}

@Test
public void testRemoveNonexistentElement() {
    arrayListWithDouble.addElement(5.0);
    boolean result = arrayListWithDouble.removeElement(10.0);
    ArrayList<Double> list = arrayListWithDouble.getList();
    assertEquals(1, list.size(), "List size should remain 1 after attempting to remove a nonexistent element.");
    assertFalse(result, "Removing a nonexistent element should return false.");
}

@Test
public void testAddNullElement() {
    Exception exception = assertThrows(NullPointerException.class, () -> {
        arrayListWithDouble.addElement(null);
    });
    assertEquals("Element cannot be null", exception.getMessage(), "Should throw NullPointerException with the correct message.");
}

@Test
public void testRemoveElementFromEmptyList() {
    boolean result = arrayListWithDouble.removeElement(5.0);
    ArrayList<Double> list = arrayListWithDouble.getList();
    assertTrue(list.isEmpty(), "List should be empty.");
    assertFalse(result, "Removing an element from an empty list should return false.");
}
```

### Critique

More test data is generated, but the code passes null as a parameter, which will cause a problem in Java. It also writes a boolean return variable for the void return method. Rating: Poor

### Example 6.16 prompt: Change it to fit void return type.

### Generated Code:

```
@Test
public void testAddNullElement() {
    assertThrows(NullPointerException.class, () -> arrayListWithDouble.addElement(null),
            "Should throw NullPointerException when adding null.");
}

@Test
public void testRemoveElementFromEmptyList() {
    arrayListWithDouble.removeElement(5.0); // Assuming removeElement has been changed to void return type
    ArrayList<Double> list = arrayListWithDouble.getList();
    assertTrue(list.isEmpty(), "List should be empty after attempting to remove an element from an empty list.");
}
```

### Critique

Still not fix the null parameter. Rating: Poor.

## Exercise

1. In Example 6.2, ask Copilot to provide an example of an equation to test the combined results of multiple methods and ensure that the equation includes a case where the denominator is zero.
2. In Example 6.5, modify the prompt to help Copilot provide the correct output.
3. In Example 6.9, provide Copilot with some data that is easy to calculate, like {1.0, 1.0, 1.0, ...} or {1.0, 2.0, 3.0, ...} to see how Copilot works.
4. In Example 6.12 and 6.13, change the ArrayList to Map and ask Copilot to generate some test cases for the class.
5. Create the class ArrayListWithString from the class ArrayListWithInteger. Then use Copilot to generate test cases for ArrayListWithString.
6. In Example 3.4 (AbecedarianChecker), use Copilot to generate test cases for isAbedidarian().

#  Unit21-Data-Structures
## Introduction
A _data structure_ is a collection of data values, organized in such a way as to increase efficiency of access.  Different kinds of data structures have different properties, and are appropriate for different kinds of applications.

As a real-world example, consider a grocery list.  Grocery lists are typically short, and "organized" in the order in which each item occurred to the shopper.  The list helps the shopper remember everything that the shopper wants to buy.  If the grocery lists grows long, the shopper might reorganize the list according to the order that items will be encountered in the store, to increase shopping efficiency.  This requires the shopper to have knowledge of the store's organization.  You may have experienced visiting a store that you "know" only to discover that the layout has changed since you were last there!  The efficiency of shopping is reduced, to put it mildly.

An _algorithm_ is a plan for accessing a data structure--for example to locate a value, or to add a new value, or to delete an existing value--in an efficient manner.  Different kinds of algorithms have different efficiencies, and different complexities of implementation, and are appropriate for different kinds of data structures.

Another "data structure" we might use for keeping track of groceries is a collection of slips of paper, with a grocery item written on each one and put in a pocket.  It's trivially easy to write a new grocery item on a slip of paper and add that to the pocket.  At the store, out plan is to remove the slips of paper one by one, and add each desribed item to our cart.  This "algorithm" is not as efficient as stepping through an organized list, but has the advantage of not depending on knowing the store layout in advance.

If we want to be careful to save our labeled slips of paper for reuse, we could use an "algorithm" in which we take a slip of paper out of our pocket at random, add the named item to our cart, and put the slip of paper back into our pocket again.  Instinctively, you probably see that this is a disaster: rather rapidly, the slips of paper we take out will be for items we already have in our cart; and if the number of slips is large, it may be a long time before we take each slip out of our pocket at least once.

In computer programs, we often deal with thousands, millions, billions or more values, and the data structures and algorithms we choose to store and interact with these values will dramatically affect the efficiency of our program.  Are you willing to wait for 10 minutes for Amazon to add a book to your shopping cart?  No: we need a better data structure and/or algorithm.  Would you need a program to produce a report of every apartment for rent in the USA in 0.001 seconds?  Probably not: we probably don't need to spend the time and money researching data structures, algorithms, and database and network performance issues in order to make this program a reality.

## Use Case -- Selection Sort
We are often presented with a collection of values--people's names, test scores, automobiles for sale, home addresses and prices--in no particular order.  To make these values easier to manage, our first instinct is to _sort_ the values.  We might sort people's names alphabetically (perhaps primarily by last name, and then secondarily by first name); test scores from high to low; automobiles for sale by price from low to high, or perhaps by number of passengers, or by mileage, or by model year; and so forth.

As a data structure, we could use an _array_ or a _list_ (depending on the programming language) to store the values.  We will then need an algorithm to sort the values contained within the array or list.

Suppose we want to sort test scores in descending order.

Examine each value in the array (or list) to find the largest value.  Then, swap that largest value with the value in the first slot of the array.  The largest value is now in the first slot.

Examine each value in the array after the first slot to find the largest of the remaining values.  Then, swap that largest remaining value with the value in the second slot of the array.  The second largest value is now in the second slot, and the largest value remains in the first slot.

Repeat this plan for the third slot: the third largest value is now in the third slot.  And so forth.

If you start with an array (or list) of N values, you will need to follow this plan N times, once for each value.

This algorithm is called _Selection Sort_: for each slot in the array, we _select_ the largest remaining value to be swapped into that slot.

How many value comparisons must we perform in order to implement Selection Sort?  For the first slot, we perform N-1 comparisons to find the largest value; for the second slot, we perform N-2 comparisons to find the second largest value; ..., and for the Nth slot, we perform N-N == 0 comparisons to find the Nth largest value.  This is (N-1) + (N-2) + ... + 1 + 0 comparisons, which is equivalent to 1 + 2 + ... + (N-1).  According to legend, the formula for this was discovered by Carl Friedrich Gauss as a schoolboy: N(N - 1)/2 == (N^2 / 2) - (N / 2).  (N^2 means N squared, here).  As N gets larger and larger, the (N / 2) part of this formula becomes less and less important compared to the (N^2 / 2) part.  We describe this as an "order N squared" algorithm.

What does this mean to us, in practical terms?  Suppose it takes T minutes to sort N values.  Most of the time of the Selection Sort algorithm is consumed by comparing values.  So, if we need to sort 10 times as many values--10N--it will take about (10**2)T or 100T minutes to sort those values.  100N values will take about 10,000T minutes.  T minutes may be considered perfectly reasonable for N values, but is 10,000T minutes reasonable for 100N values?  Perhaps not.

## Several Solved Examples Using Copilot

## Prompts and Code Critique
We will show each prompt and the resulting code generated by Copilot. We will follow each example
with a short critique and rating. The ratings will be Poor, Fair, or Good.  Code generation will be in Python for these examples, but could be in Java, C++, or some other language.

### Example 21.1 prompt:  Write a function named selection_sort in Python that takes a list as its argument and that applies the Selection Sort algorithm to sort the list items in ascending order.

### Generated Output
```
Sure! Here’s how you can write the selection_sort function in Python:

def selection_sort(lst):
    for i in range(len(lst)):
        min_index = i
        for j in range(i+1, len(lst)):
            if lst[j] < lst[min_index]:
                min_index = j
        lst[i], lst[min_index] = lst[min_index], lst[i]
    return lst

# Example usage
my_list = [64, 25, 12, 22, 11]
sorted_list = selection_sort(my_list)
print(sorted_list)
This function iterates over the list, finds the smallest element in the unsorted portion, and swaps it with the element at the current position. The result is a sorted list in ascending order. Give it a try
```
### Critique
A clean and correct implementation of the Selection Sort algorithm in Python, with some testing code that sorts a list of 5 "random" integer values.  Since arguments are passed by reference in Python, it is unnecessary to return a reference to the sorted list.  Rating: Good.
### Example 21.2 prompt:  Revise the selection_sort function so that sorting of the argument list is in place, with no return statement.

### Generated output
```
Got it! Here’s the revised version of the selection_sort function that sorts the list in place and doesn’t return anything:

def selection_sort(lst):
    for i in range(len(lst)):
        min_index = i
        for j in range(i+1, len(lst)):
            if lst[j] < lst[min_index]:
                min_index = j
        lst[i], lst[min_index] = lst[min_index], lst[i]

# Example usage
my_list = [64, 25, 12, 22, 11]
selection_sort(my_list)
print(my_list)
This function directly modifies the input list without returning it. Sorted in place, good to go
```
### Critique
Revised as requested.  Rating: Good.
### Example 12.3 prompt:  What is the performance of the Selection Sort algorithm?

### Generated output
'''
Selection Sort has a time complexity of O(n²) in the worst, best, and average cases because it always involves comparing and swapping elements in nested loops. This quadratic time complexity makes it less efficient for large lists compared to more advanced algorithms like Quick Sort or Merge Sort. On the upside, it’s straightforward and easy to understand! It's space-efficient too, requiring only a constant amount of additional memory (O(1)).
'''
### Critique
Correct and clear ... if you know what O(...) means!  Rating: Good

### Example 12.4 prompt:  Explain what O(...) means in performance analysis.

### Generated output
'''
Big O notation, or O(...), is used to describe the efficiency of an algorithm. It measures how the runtime or space requirements grow as the input size increases. Here are some common examples:

O(1): Constant time; doesn't change with the size of the input.

O(n): Linear time; grows directly proportional to the input size.

O(n²): Quadratic time; grows proportional to the square of the input size, like Selection Sort.

O(log n): Logarithmic time; grows slower than the input size.

O(n log n): Linearithmic time; common in efficient sorting algorithms like Merge Sort.

Big O helps predict the performance and scalability of algorithms. Handy, right?
'''
### Critique
A helpful description and summary.  The user could ask further questions for more clarification.  Rating: Good

### Example 12.5 prompt:  What are other commonly used sorting algorithms?

### Generated output
'''
There are quite a few algorithms people turn to for efficient sorting, depending on the context. Here are some popular ones:

Quick Sort: Uses a divide-and-conquer approach with a pivot element to partition the list and sort it. It’s fast in practice, with an average time complexity of O(n log n).

Merge Sort: Another divide-and-conquer algorithm that splits the list into halves, sorts each half, and then merges them back together. It’s stable and has a time complexity of O(n log n).

Bubble Sort: Simple, but not very efficient. It repeatedly steps through the list, compares adjacent items, and swaps them if they're in the wrong order. Time complexity is O(n²).

Insertion Sort: Builds the sorted array one element at a time, picking each next element and inserting it into its correct position. It’s efficient for small or nearly sorted data, with a time complexity of O(n²).

Heap Sort: Builds a heap from the input data, then repeatedly extracts the maximum (or minimum) element to build the sorted array. Its time complexity is O(n log n).

Each algorithm has its strengths and weaknesses, so the best choice often depends on the specific needs of your task. Which one interests you most?
'''
### Critique
A helpful summary.  The user can ask to see implementations of each sorting algorithm, in Python, Java, C++, or some other language.  Rating: Good

## Exercises
## References

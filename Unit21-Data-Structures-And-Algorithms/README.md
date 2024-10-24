#  Unit21-Data-Structures
## Introduction
A _data structure_ is a collection of data values, organized in such a way as to increase efficiency of access.  Different kinds of data structures have different properties, and are appropriate for different kinds of applications.

As a real-world example, consider a grocery list.  Grocery lists are typically short, and "organized" in the order in which each item occurred to the shopper.  The list helps the shopper remember everything that the shopper wants to buy.  If the grocery lists grows long, the shopper might reorganize the list according to the order that items will be encountered in the store, to increase shopping efficiency.  This requires the shopper to have knowledge of the store's organization.  You may have experienced visiting a store that you "know" only to discover that the layout has changed since you were last there!  The efficiency of shopping is reduced, to put it mildly.

An _algorithm_ is a plan for accessing a data structure--for example to locate a value, or to add a new value, or to delete an existing value--in an efficient manner.  Different kinds of algorithms have different efficiencies, and different complexities of implementation, and are appropriate for different kinds of data structures.

Another "data structure" we might use for keeping track of groceries is a collection of slips of paper, with a grocery item written on each one and put in a pocket.  It's trivially easy to write a new grocery item on a slip of paper and add that to the pocket.  At the store, out plan is to remove the slips of paper one by one, and add each desribed item to our cart.  This "algorithm" is not as efficient as stepping through an organized list, but has the advantage of not depending on knowing the store layout in advance.

If we want to be careful to save our labeled slips of paper for reuse, we could use an "algorithm" in which we take a slip of paper out of our pocket at random, add the named item to our cart, and put the slip of paper back into our pocket again.  Instinctively, you probably see that this is a disaster: rather rapidly, the slips of paper we take out will be for items we already have in our cart; and if the number of slips is large, it may be a long time before we take each slip out of our pocket at least once.  In fact, if we don't know in advance how many slips of paper there are, we can never know whether we have retrieved each one!

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
### Example 21.3 prompt:  What is the performance of the Selection Sort algorithm?

### Generated output
Selection Sort has a time complexity of O(n²) in the worst, best, and average cases because it always involves comparing and swapping elements in nested loops. This quadratic time complexity makes it less efficient for large lists compared to more advanced algorithms like Quick Sort or Merge Sort. On the upside, it’s straightforward and easy to understand! It's space-efficient too, requiring only a constant amount of additional memory (O(1)).
### Critique
Correct and clear ... if you know what O(...) means!  Rating: Good

### Example 21.4 prompt:  Explain what O(...) means in performance analysis.

### Generated output
Big O notation, or O(...), is used to describe the efficiency of an algorithm. It measures how the runtime or space requirements grow as the input size increases. Here are some common examples:

O(1): Constant time; doesn't change with the size of the input.

O(n): Linear time; grows directly proportional to the input size.

O(n²): Quadratic time; grows proportional to the square of the input size, like Selection Sort.

O(log n): Logarithmic time; grows slower than the input size.

O(n log n): Linearithmic time; common in efficient sorting algorithms like Merge Sort.

Big O helps predict the performance and scalability of algorithms. Handy, right?
### Critique
A helpful description and summary.  The user could ask further questions for more clarification.  Rating: Good

### Example 21.5 prompt:  What are other commonly used sorting algorithms?

### Generated output
There are quite a few algorithms people turn to for efficient sorting, depending on the context. Here are some popular ones:

Quick Sort: Uses a divide-and-conquer approach with a pivot element to partition the list and sort it. It’s fast in practice, with an average time complexity of O(n log n).

Merge Sort: Another divide-and-conquer algorithm that splits the list into halves, sorts each half, and then merges them back together. It’s stable and has a time complexity of O(n log n).

Bubble Sort: Simple, but not very efficient. It repeatedly steps through the list, compares adjacent items, and swaps them if they're in the wrong order. Time complexity is O(n²).

Insertion Sort: Builds the sorted array one element at a time, picking each next element and inserting it into its correct position. It’s efficient for small or nearly sorted data, with a time complexity of O(n²).

Heap Sort: Builds a heap from the input data, then repeatedly extracts the maximum (or minimum) element to build the sorted array. Its time complexity is O(n log n).

Each algorithm has its strengths and weaknesses, so the best choice often depends on the specific needs of your task. Which one interests you most?
### Critique
A helpful summary.  The user can ask to see implementations of each sorting algorithm, in Python, Java, C++, or some other language.  Rating: Good

### Example 21.6 prompt:  What other kinds of algorithms are there?

### Generated output
There are many types of algorithms, each designed to solve specific kinds of problems. Here's a quick tour through some notable categories:

Search Algorithms: These help in finding an element within a data structure. Examples include Binary Search and Depth-First Search (DFS).

Graph Algorithms: These operate on graph data structures. Think Dijkstra's algorithm for shortest paths and Kruskal's algorithm for minimum spanning trees.

Dynamic Programming: This approach solves complex problems by breaking them down into simpler subproblems. Algorithms like the Fibonacci sequence, and the Knapsack problem are classic examples.

Divide and Conquer: These divide the problem into smaller subproblems, solve them independently, and then combine their results. Merge Sort and Quick Sort fall under this category.

Greedy Algorithms: These make the locally optimal choice at each stage in hopes of finding the global optimum. Examples include Prim's algorithm for Minimum Spanning Trees and the Fractional Knapsack problem.

Backtracking Algorithms: These systematically search for a solution by trying out possible solutions and undoing those that fail to meet the criteria. A good example is the N-Queens problem.

Machine Learning Algorithms: These learn from data to make predictions or decisions. Examples include Decision Trees, Neural Networks, and Support Vector Machines.

Cryptographic Algorithms: These focus on securing information. Think RSA and AES for encryption and decryption processes.

Algorithms are the lifeblood of computational problem-solving. Got any specific area you're interested in?
### Critique
A helpful and reasonably complete summary of algorithm categories, other than sorting.  The user can ask for more details about these categories, and to see implementations of specific algorithms in Python, Java, C++, or some other language.  Rating: Good

### Example 21.7 prompt:  In addition to the list (or array), what other kinds of data structures are there?

### Generated output
There are plenty of data structures out there, each suited for different tasks. Some key ones include:

Linked Lists: Elements are stored in nodes, with each node pointing to the next. Great for dynamic memory allocation.

Stacks: LIFO (Last In, First Out) structure. Think of it like a stack of books; you add and remove from the top.

Queues: FIFO (First In, First Out) structure. Like a line at a store; you add to the back and remove from the front.

Trees: Hierarchical structures with nodes. Binary Trees, AVL Trees, and Red-Black Trees fall into this category.

Graphs: Consist of vertices (nodes) and edges (connections). Used in networking and pathfinding algorithms.

Hash Tables: Store key-value pairs, allowing for fast data retrieval based on a key.

Heaps: A type of tree-based structure. Used in priority queues and heap sort.

Trie: A special type of tree used to store associative data structures. Great for things like autocomplete features.

Each of these has unique properties and use cases. Anything catch your interest?
### Critique
A helpful and reasonably complete summary of data structure categories, other than list/array.  The user can ask for more details about these categories, and to see implementations of specific data structures in Python, Java, C++, or some other language.  Rating: Good

### Example 21.8 prompt:  What is a Binary Tree?  Show me a diagram.

### Generated output
A Binary Tree is a hierarchical data structure where each node has at most two children, called the left child and the right child. The tree starts at the root node and branches out to the leaves.

Here’s a simple diagram:

```
      A
     / \
    B   C
   / \   \
  D   E   F
```

A is the root.

B and C are the children of A.

D and E are the children of B.

F is the child of C.

Simple, yet powerful for organizing data! Anything specific you'd like to know about Binary Trees?

### Critique
A correct but thin description and diagram of a binary tree.  Would be better with more detail, but does ask the user whether they would like anything more specific.  Rating: Fair

### Example 21.9 prompt:  What kinds of Binary Trees are there?

### Generated output
There are several types of Binary Trees, each with unique properties and use cases:

Full Binary Tree: Every node other than the leaves has two children.

Complete Binary Tree: All levels are fully filled except possibly the last level, which is filled from left to right.

Perfect Binary Tree: All internal nodes have two children and all leaves are at the same level.

Balanced Binary Tree: The height of the left and right subtrees of any node differ by at most one.

Binary Search Tree (BST): The left child contains values less than the parent node, and the right child contains values greater than the parent node. This makes searching efficient.

AVL Tree: A self-balancing binary search tree where the heights of two child subtrees of any node differ by at most one, ensuring O(log n) height.

Red-Black Tree: A binary search tree with an additional property of nodes being colored red or black, which ensures balance and maintains O(log n) time complexity for insertion and deletion.

These structures help optimize different operations, such as searching, inserting, and balancing data. Curious about any one in particular?
### Critique
A helpful and reasonable overview of common types of Binary Trees.  The user can ask for more details about these types of Binary Trees, and to see implementations of specific types in Python, Java, C++, or some other language.  Rating: Good

### Example 21.10 prompt:  Show me Python code that implements a Binary Search Tree class called BST.

### Generated output
Alright! Here’s a basic implementation of a Binary Search Tree (BST) class in Python:

```
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key

class BST:
    def __init__(self):
        self.root = None

    def insert(self, key):
        if self.root is None:
            self.root = Node(key)
        else:
            self._insert(key, self.root)

    def _insert(self, key, current_node):
        if key < current_node.val:
            if current_node.left is None:
                current_node.left = Node(key)
            else:
                self._insert(key, current_node.left)
        elif key > current_node.val:
            if current_node.right is None:
                current_node.right = Node(key)
            else:
                self._insert(key, current_node.right)

    def search(self, key):
        return self._search(key, self.root)

    def _search(self, key, current_node):
        if current_node is None:
            return False
        elif key == current_node.val:
            return True
        elif key < current_node.val:
            return self._search(key, current_node.left)
        else:
            return self._search(key, current_node.right)

    def inorder_traversal(self):
        return self._inorder_traversal(self.root, [])

    def _inorder_traversal(self, current_node, traversal):
        if current_node:
            traversal = self._inorder_traversal(current_node.left, traversal)
            traversal.append(current_node.val)
            traversal = self._inorder_traversal(current_node.right, traversal)
        return traversal

# Example usage
bst = BST()
bst.insert(10)
bst.insert(5)
bst.insert(20)
bst.insert(15)
bst.insert(25)

print(bst.search(15))  # Output: True
print(bst.search(30))  # Output: False
print(bst.inorder_traversal())  # Output: [5, 10, 15, 20, 25]
```

This BST class provides basic methods for inserting nodes, searching for values, and performing an in-order traversal. How does this look?
### Critique
A clear implementation of the BST class, with the three most important basic methods: insert(), search(), and inorder_traversal().  Rating: Good

### Example 21.11 prompt:  Make the Node class a private class within the BST class, and add methods min(), max(), is_identical() (same values and shape), and is_equal() (same values)

### Generated output
Alright! Here’s the enhanced BST class with a private Node class and the additional methods you requested:

```
class BST:
    class _Node:
        def __init__(self, key):
            self.left = None
            self.right = None
            self.val = key

    def __init__(self):
        self.root = None

    def insert(self, key):
        if self.root is None:
            self.root = self._Node(key)
        else:
            self._insert(key, self.root)

    def _insert(self, key, current_node):
        if key < current_node.val:
            if current_node.left is None:
                current_node.left = self._Node(key)
            else:
                self._insert(key, current_node.left)
        elif key > current_node.val:
            if current_node.right is None:
                current_node.right = self._Node(key)
            else:
                self._insert(key, current_node.right)

    def search(self, key):
        return self._search(key, self.root)

    def _search(self, key, current_node):
        if current_node is None:
            return False
        elif key == current_node.val:
            return True
        elif key < current_node.val:
            return self._search(key, current_node.left)
        else:
            return self._search(key, current_node.right)

    def inorder_traversal(self):
        return self._inorder_traversal(self.root, [])

    def _inorder_traversal(self, current_node, traversal):
        if current_node:
            traversal = self._inorder_traversal(current_node.left, traversal)
            traversal.append(current_node.val)
            traversal = self._inorder_traversal(current_node.right, traversal)
        return traversal

    def min(self):
        if self.root is None:
            return None
        return self._min(self.root)

    def _min(self, current_node):
        while current_node.left:
            current_node = current_node.left
        return current_node.val

    def max(self):
        if self.root is None:
            return None
        return self._max(self.root)

    def _max(self, current_node):
        while current_node.right:
            current_node = current_node.right
        return current_node.val

    def is_identical(self, other):
        return self._is_identical(self.root, other.root)

    def _is_identical(self, node1, node2):
        if not node1 and not node2:
            return True
        if node1 and node2 and node1.val == node2.val:
            return (self._is_identical(node1.left, node2.left) and 
                    self._is_identical(node1.right, node2.right))
        return False

    def is_equal(self, other):
        return sorted(self.inorder_traversal()) == sorted(other.inorder_traversal())

# Example usage
bst1 = BST()
bst1.insert(10)
bst1.insert(5)
bst1.insert(20)
bst1.insert(15)
bst1.insert(25)

bst2 = BST()
bst2.insert(10)
bst2.insert(5)
bst2.insert(20)
bst2.insert(15)
bst2.insert(25)

print(bst1.min())  # Output: 5
print(bst1.max())  # Output: 25
print(bst1.is_identical(bst2))  # Output: True
print(bst1.is_equal(bst2))  # Output: True

bst2.insert(30)
print(bst1.is_identical(bst2))  # Output: False
print(bst1.is_equal(bst2))  # Output: False
```

The min() method finds the smallest value, max() finds the largest, is_identical() checks if two BSTs have the same structure and values, and is_equal() checks if two BSTs contain the same values, regardless of structure. This should cover it!
### Critique
Very nicely done enhancements.  Lacks a test of two BST objects that are equal but not identical.  Rating: Good

### Example 21.12 prompt:  Add tests for two BST objects that are equal but not identical

### Generated output
Alright, let's write some tests to check if two BST objects are equal in terms of values but not identical in structure:

```
# Tests for two BST objects that are equal but not identical
bst1 = BST()
bst1.insert(10)
bst1.insert(5)
bst1.insert(20)
bst1.insert(15)
bst1.insert(25)

bst2 = BST()
bst2.insert(20)
bst2.insert(10)
bst2.insert(5)
bst2.insert(15)
bst2.insert(25)

# Check if they are equal but not identical
print(f"bst1 and bst2 have the same values: {bst1.is_equal(bst2)}")  # Output: True
print(f"bst1 and bst2 are structurally identical: {bst1.is_identical(bst2)}")  # Output: False
```

This setup tests the equality in values and differences in structure effectively. Everything clicking into place?

### Critique
A good example.  Rating: Good
### Example 21.13 prompt:  Describe the search performance of this BST class

### Generated output
Searching in a Binary Search Tree (BST) like the one we implemented has a best-case time complexity of O(log n) and a worst-case time complexity of O(n), where n is the number of nodes in the tree. Here’s how these scenarios unfold:

Best-case scenario (O(log n)): This occurs when the BST is balanced, meaning that the height of the tree is minimized. In such cases, each level of the tree roughly halves the number of nodes to be searched, resulting in a logarithmic search time.

Worst-case scenario (O(n)): This occurs when the BST is unbalanced, particularly when it degrades into a linked list (i.e., all nodes have only one child). In this case, searching for a value might require traversing all the nodes, making the search time linear.

The performance heavily depends on the tree's balance, which can be managed with self-balancing BSTs like AVL Trees or Red-Black Trees. Otherwise, operations on a poorly balanced BST can be inefficient.

Want to dive into self-balancing trees or try something different?

### Critique
A reasonable answer, but without describing how balanced and unbalanced BSTs could arise.  Suggests investigating self-balancing trees, which is great.  Rating: Good

### Example 21.14 prompt:  How could balanced vs. unbalanced BSTs occur?

### Generated output
Balanced BSTs and unbalanced BSTs are products of how elements are inserted:

1.  Balanced BST: Inserting elements in a random or optimal order tends to produce a balanced tree, where the left and right subtrees of any node have roughly the same height. Self-balancing BSTs, like AVL trees or Red-Black trees, automatically adjust themselves to remain balanced after insertions and deletions.

2.  Unbalanced BST: If elements are inserted in a sorted or nearly sorted order, the BST becomes skewed, resembling a linked list. For example, inserting the elements 1, 2, 3, 4, 5 in ascending order would create an unbalanced BST, as each node will have only one child.

Balancing keeps operations efficient by maintaining a logarithmic height. Want to explore self-balancing trees or learn about different data structures?
### Critique
A very good answer.  Rating: Good

### Example 21.15 prompt:  What are the advantages and disadvantages of a BST vs. and AVL Tree?

### Generated output
The tale of BSTs vs. AVL Trees: each has its moments of glory and its own set of quirks.

**Binary Search Tree (BST)**

**Advantages:**

1.  **Simplicity**: Easy to implement and understand.

2.  **Flexible**: Easier to modify (insert, delete nodes) without needing to constantly rebalance.

3.  **Good Performance for Random Data**: For moderately sized, random data, performance can be decent.

**Disadvantages:**

1.  **Potentially Unbalanced**: Without self-balancing, a BST can become skewed, degrading performance to O(n) for operations like search, insert, and delete.

2.  **No Guarantees on Height**: Can’t guarantee logarithmic height, which impacts performance predictability.

**AVL Tree**

**Advantages:**

1.  **Self-Balancing**: Ensures the tree remains balanced after every insertion and deletion, maintaining O(log n) time complexity for search, insert, and delete operations.

2.  **Height Guarantees**: Provides a balanced structure, ensuring consistent and predictable performance.

**Disadvantages:**

1.  **Complexity**: More complex to implement and understand compared to a plain BST.

2.  **Overhead**: Requires additional memory and processing time to maintain balance through rotations after insertions and deletions.

3.  **Slower** for Small Data Sets: Might introduce unnecessary overhead for small or already balanced datasets where a simple BST might suffice.

In essence, if you need consistent performance and work with large datasets, AVL Trees are your friends. For simpler tasks or smaller datasets, a BST might do just fine. Got more angles you want to explore?
### Critique
A very good answer.  Rating: Good

## Exercises
Ask Copilot to:
1.  Explain what is meant by "rotations after insertions and deletions" within an AVT Tree, with illustrative diagrams.
2.  Add an implementation of a delete() method to the BST class, without concern for any resulting search performance degradation.  Do you observe anything interesting about the long-term impact of this delete() implementation?
3.  Show the Python code for an AVLTree class, including insert(), delete(), min(), max(), is_equal(), is_identical(), and inorder_traversal() methods.  What is different about how a BST Node is implemented vs. how an AVLTree Node is implemented?
4.  Describe a Red Black Tree, and list the properties of a correctly implemented Red Black Tree.
5.  Describe the advantages and disadvantages of a Red Black Tree vs. and AVL Tree.
6.  Show various ways of computing the Nth Fibonacci number in Python, including iteration, recursion, recursion with memoization, closed-form computation, and lookup table.  What is the performance of each of these algorithms?
7.  Show the Python code for a Stack class, and describe use cases for a Stack.
8.  Show the Python code for a Queue class, and describe use cases for a Queue.
9.  Show the Python code for a Heap class, and for the Heap Sort algorithm.
10.  Show the Python code for a Hash Table class, and describe use cases for a Hash Table.
11.  Describe situations where an AVLTree may be preferable to a Hash Table.
12.  Describe the idea of a general Graph, and show diagrams of undirected vs. directed and unweighted vs. weighted graphs.
13.  Describe the Breadth-First Search algorithm for a general undirected, unweighted Graph.
14.  Show the Python code that implements BFS for a general undirected, unweighted Graph.
15.  Describe the Depth-First Search algorithm for a general undirected, unweighted Graph.
16.  Show the Python code that implements DFS for a general undirected, unweighted Graph.
17.  Describe the advantages and disadvantages of BFS vs. DFS.
18.  Describe an algorithm that finds all shortest paths between nodes in a directed, weighted Graph.
19.  Describe what Dynamic Programming is.
20.  Describe what an NP algorithm is.

LeetCode is an excellent source of questions about coding in general and about data structures and algorithms.  By using LeetCode in combination with Copilot, you can simulate knowing all kinds of things!

## References
Two of the best, of many, many algorithm and data structure books available:

**Introduction to Algorithms, 4th Edition**, 2022, by Cormen, Leiserson, Rivest, and Stein, ISBN 978-0262046305

**Algorithms Illuminated: Omnibus Edition**, 2022, by Tim Roughgarden, ISBN 978-0999282984


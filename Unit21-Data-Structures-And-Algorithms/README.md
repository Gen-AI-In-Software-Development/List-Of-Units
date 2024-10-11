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

Examine each value in the array after the first slot to find the largest of the remaining values.  Then, swap that largest remaining value with the value in the second slot of the array.  The second largest value is now in the second slot.

Repeat this plan for the third slot: the third largest value is now in the third slot.  And so forth.

If you start with an array (or list) of N values, you will need to follow this plan N times, once for each value.

This algorithm is called _Selection Sort_: for each slot in the array, we _select_ the largest remaining value to be swapped into that slot.

How many value comparisons must we perform in order to implement Selection Sort?  For the first slot, we perform N-1 comparisons to find the largest value; for the second slot, we perform N-2 comparisons to find the second largest value; ..., and for the Nth slot, we perform N-N == 0 comparisons to find the Nth largest value.  This is (N-1) + (N-2) + ... + 1 + 0 comparisons, which is equivalent to 1 + 2 + ... + (N-1).  According to legend, the formula for this was discovered by Carl Friedrich Gauss as a schoolboy: N(N - 1)/2 == (N^2 / 2) - (N / 2).  (N^2 means N squared, here).  As N gets larger and larger, the (N / 2) part of this formula becomes less and less important compared to the (N^2 / 2) part.  We describe this as an "order N squared" algorithm.

What does this mean to us, in practical terms?  Suppose it takes T minutes to sort N values.  Most of the time of the Selection Sort algorithm is consumed by comparing values.  So, if we need to sort 10 times as many values--10N--it will take about (10**2)T or 100T minutes to sort those values.  100N values will take about 10000T minutes.  T minutes may be considered perfectly reasonable for N values, but is 10000T minutes reasonable for 100N values?  Perhaps not.

## Several Solved Examples Using Copilot
## Critical Evaluations of the Examples
## Exercises
## References

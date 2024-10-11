#  Unit21-Data-Structures
## Introduction
A _data structure_ is a collection of data values, organized in such a way as to increase efficiency of access.  Different kinds of data structures have different properties, and are appropriate for different kinds of applications.

As a real-world example, consider a grocery list.  Grocery lists are typically short, and "organized" in the order in which each item occurred to the shopper.  The list helps the shopper remember everything that the shopper wants to buy.  If the grocery lists grows long, the shopper might reorganize the list according to the order that items will be encountered in the store, to increase shopping efficiency.  This requires the shopper to have knowledge of the store's organization.  You may have experienced visiting a store that you "know" only to discover that the layout has changed since you were last there!  The efficiency of shopping is reduced, to put it mildly.

An _algorithm_ is a plan for accessing a data structure--for example to locate a value, or to add a new value, or to delete an existing value--in an efficient manner.  Different kinds of algorithms have different efficiencies, and different complexities of implementation, and are appropriate for different kinds of data structures.

Another "data structure" we might use for keeping track of groceries is a collection of slips of paper, with a grocery item written on each one and put in a pocket.  It's trivially easy to write a new grocery item on a slip of paper and add that to the pocket.  At the store, out plan is to remove the slips of paper one by one, and add each desribed item to our cart.  This "algorithm" is not as efficient as stepping through an organized list, but has the "advantage" of not depending on knowing the store layout in advance.

If we want to be careful to save our labeled slips of paper, we could use an "algorithm" in which we take a slip of paper out of our pocket at random, add the named item to our cart, and put the slip of paper back into our pocket again.  Instinctively, you probably see that this is a disaster: rather rapidly, the slips of paper we take out will be for items we already have in our cart; and if the number of slips is large, it may take a long time before we take each slip out of our pocket at least once.

In computer programs, we often deal with thousands, millions, billions or more values, and the data structures and algorithms we choose to store and interact with these values will dramatically affect the efficiency of our program.  Are you willing to wait for 10 minutes for Amazon to add a book to your shopping cart?  No: we need a better data structure/algorithm.  Would you need a program to produce a report of every apartment for rent in the USA in 0.001 seconds?  Probably not: we probably don't need to spend the time and money researching data structures, algorithms, and database and network performance issues in order to make this program a reality.

## Compelling Use Case
## Several Solved Examples Using Copilot
## Critical Evaluations of the Examples
## Exercises
## References

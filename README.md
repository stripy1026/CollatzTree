# CollatzTree

## It is a simple excersize of Collatz conjecture.

1. Select a integer more than 0.
2. If the number is even, divide by 2.
3. If the number is odd, multiply by 3 and add 1.
4. The number always ends up with 1.

For example)
````
4 -> 2 -> 1
6 -> 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
````

If it is true, Can I store all positive integers in Collatz tree ?
````
Mechanism is like:
root node is 1.
left child node's value becomes (2 * parent node's value)
right one's value becomes (parent node's value - 1) / 3, if it is possible.
````

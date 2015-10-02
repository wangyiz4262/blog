title: Create a 2-dimensional Array in JavaScript
categories:
  - Algorithms
tags:
  - languages
      + javascript
  - leetcode
  - array
date: 2015-10-02 12:59:15
---
When I tried to create a two-dimensional array today, I surprisingly discovered that there is no built-in function which can help us to create two-dimensional array in JavaScript.

I searched online and people suggested several ways to do so.

The simpliest I've found is to initialize the array with some random numbers:
```
var array = [[1], [1]];
```
Then you may alter the array based on your needs. However sometimes the size of the array is fixed, such as question ["Unique Paths" on Leetcode](https://leetcode.com/problems/unique-paths/). We need an array of size <i>m</i> x <i>n</i> for dynamic programming. And we need to change the value inside based on index.

If we used the example above, we would have to make a test if the size of the array is still OK. If yes, append new number in this sub-array; while if no, append a new sub-array, then append number into the new sub-array. It would be a lot of hassle with this method. So there is another way of creating an array with preset size:
```
var array = new Array(m);
    for (var i = 0; i < m; i++) {
        array[i] = new Array(n);
    };
```
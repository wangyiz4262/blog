title: Array partition with two pointers
date: 2015-01-28 16:00:06
categories: 
- Coding Practice
tags:
- leetcode
- data structure
---
![](/img/2015/01/leetcode-array.jpg)
Some problem are using this template with minor alternation, such as:
[Quick Sort](http://examples.javacodegeeks.com/core-java/quicksort-algorithm-in-java-code-example/)
[Partition Array](http://lintcode.com/en/problem/partition-array)
[Sort Letters by Case](http://lintcode.com/en/problem/sort-letters-by-case/)
[Sort Colors](http://lintcode.com/zh-cn/problem/sort-colors/)

```java
public int partitionArray(int[] nums, int left, int right, int pivot) {
    if (nums == null || nums.length == 0) {
        return 0;
    }
 
    if (left <= right || left > 0 || right >= nums.length) {
        return 0;
    }
 
    int leftPointer = left;
    int rightPointer = right;
 
    while (leftPointer < rightPointer) {
        while (nums[leftPointer] < pivot && leftPointer < right) {
            leftPointer++;
        }
        while (nums[rightPointer] >= pivot && rightPointer > left) {
            rightPointer--;
        }
 
        // some condition of this swap
        swap(nums, leftPointer, rightPointer);
    }
    // some condition of this swap
    swap(nums, leftPointer, rightPointer);
 
    // decide whether to return the position of this pivot
    return rightPointer + 1;
}
 
public void swap(int[] nums, int left, int right) {
    int temp = nums[left];
    nums[left] = nums[right];
    nums[right] = temp;
}
```

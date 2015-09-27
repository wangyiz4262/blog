title: Corner cases for binary trees
date: 2015-02-05 16:55:37
categories:
- Algorithms
tags:
- leetcode
- tree
---
![](/img/leetcode-tree.jpg)
When doing LeetCode problems, some corner cases should be considered when traversing through the tree, otherwise unexpected errors shall appear. Examples:
[Symmetric Tree](https://oj.leetcode.com/problems/symmetric-tree/)
[Same Tree](https://oj.leetcode.com/problems/same-tree/)

The following code takes [Symmetric Tree](https://oj.leetcode.com/problems/symmetric-tree/) as an example:
```
public void method(TreeNode root) {
    if (root == null) {
        return something;
    }
 
    // when the node is leaf node
    if (root.left == null && root.right == null) {
        return something;
    }
 
    // when the node has both children
    if (root.left != null && root.right != null) {
        if (root.left.val == root.right.val) {
            do something;
        } else {
            do something;
        }
    }
 
    // when the node is not leaf node yet
    do something;
}
```
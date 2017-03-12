title: Recursion and Stack memory
date: 2015-02-07 17:02:07
categories:
- Coding Practice
tags:
- leetcode
- data structure
---
![](/img/2015/02/leetcode-stack.png)

When I was thinking about the problem [Validate Binary Search Tree](https://oj.leetcode.com/problems/validate-binary-search-tree/), my code runs like this:

```java
public boolean isValidBST(TreeNode root) {
    TreeNode previous = null;
    return helper(root, previous);
}
 
public boolean helper(TreeNode root, TreeNode previous) {
    if (root == null) {
        return true;
    }
 
    boolean left = helper(root.left, previous);
    if (previous != null && root.val <= previous.val) {
        return false;
    }
    previous = root;
    boolean right = helper(root.right, previous);
 
    return left && right;
}
```

The idea was simple by using BST’s good feature: in-order traversal is in order. So I used a temporary tree node “previous” to record the last visited node on the stack. After comparing the value of previous node and the current node, I changed the previous node to be the current node, and then go to to the next iteration, which might be popping out the left child and returning to its parent, or going to the right child.

The algorithm should correct? However when testing a tree in the following form, it gave me a result as TRUE.

```
  1
 /
1
```

So where is the problem?

The problem comes from the assignment:
```
previous = root;
```

The reason is that when using recursion, each time the function calls itself, the program push all the variable on the current stage into a stack on memory, so that when you return back to this stage, everything restores back to their value as last time they were. But when storing objects in Java, what the stack stores is the reference, or the memory address to this object, while the actual data is stored on the heap. So even though you have changed the actual object this variable referring to, as in this case TreeNode previous is assigned to the current root node, when restored to the last stage, the reference of previous changed back the last stage, which might be either the parent node of root, or the right child of root. This is reason why it gives an erroneous result.

To make this program work, simply change the actual node value of previous instead of changing the reference and it should be fine.

```
previous.val = root.val;
```
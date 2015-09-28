title: DFS in Binary Tree
date: 2015-02-04 16:58:00
categories:
- Algorithms
tags:
- leetcode
- tree and graph

---
![](/img/leetcode-tree.jpg)

Let’s think about this problem: [Sum Root to Leaf Numbers](https://oj.leetcode.com/problems/sum-root-to-leaf-numbers/).

A general solution is like below:
```
public int sumNumbers(TreeNode root) {
    if (root == null) {
        return 0;
    }
 
    ArrayList<String> numbers = new ArrayList<String>();
    StringBuffer route = new StringBuffer();
    helper(root, numbers, route);
 
    int result = 0;
    for (String str : numbers) {
        result += Integer.parseInt(str);
    }
 
    return result;
}
public void helper(TreeNode root, ArrayList<String> numbers, StringBuffer route) {
    if (root == null) {
        return;
    }
 
    if (root.left == null && root.right == null) {
        route.append(root.val);
        numbers.add(route.toString());
        route.deleteCharAt(route.length() - 1);
        return;
    }
 
    route.append(root.val);
    helper(root.left, numbers, route);
    helper(root.right, numbers, route);
    route.deleteCharAt(route.length() - 1);
}
```

Actually the core part for DFS recursion is the last two calls of helper() method:

```
helper(root.left);
helper(root.right);
```

In this way, we have traverse the tree in pre-order. So this is the essence of DFS for binary trees. Then we just include three other pieces, and we are done with this sort of questions.

1. Checking null for the current node is a routine operation. This means we have reached the bottom of this iteration, either on the left side or the right side, then we return to the previous level of the stack.
2. Do something about the current node. This is the actually what the problem is asking for. In the example above, we check if we have reached the leaf node. If we do, add the update the preliminary result into the ArrayList. If we need to use backtrack to record the results, don’t forget to remove the last added element from the preliminary result before we continue.
3. The order of the recursion depends on whether it is pre-order, in-order, or post-order.

A similar problem is: [Path Sum II](https://oj.leetcode.com/problems/path-sum-ii/)

title: Breadth-First Traversal with Queue
date: 2015-01-29 16:42:41
categories:
- Algorithms
tags:
- leetcode
- tree and graph
- stack and queue
---
![](/img/leetcode-tree.jpg)

Breadth-First Traversal can be used in many places, such as traversing level-by-level in a binary tree, or BFS in a graph. All those are implemented with a Queue.
[Binary Tree Level Order Traversal](https://oj.leetcode.com/problems/binary-tree-level-order-traversal/)
[Binary Tree Level Order Traversal II](https://oj.leetcode.com/problems/binary-tree-level-order-traversal-ii/)
[Binary Tree Zigzag Level Order Traversal](https://oj.leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)
[Word Ladder](https://oj.leetcode.com/problems/word-ladder/)

Take binary tree level-by-level traverse for example, we can therefore have this template as a general summary:
```
public ArrayList<List<Integer>> levelOrder(TreeNode root) {
    ArrayList<List<Integer>>  result = new ArrayList<ArrayList<Integer>>();
 
    if (root == null) {
        return result;
    }
 
    Queue<TreeNode> queue = new LinkedList<TreeNode>();
 
    queue.offer(root);
 
    while (!queue.isEmpty()) {
        ArrayList<Integer> visitingRecord = new ArrayList<Integer>();
        int size = queue.size();
        for (int i = 0; i < size; i++) {
            TreeNode node = queue.poll();
            visitingRecord.add(node.val);
            if (node.left != null) {
                queue.offer(node.left);
            }
            if (node.right != null) {
                queue.offer(node.right);
            }
        }
        result.add(visitingRecord);
    }
 
    return result;
}
```

There are eight main parts in the template:
1. Validate the parameter passed in if (root == null).
2. Create a queue and include the first element into the queue.
3. Enter a loop based on the emptiness of the queue.
4. Get the size of the queue, which is actually the ```SIZE OF EACH LAYER```.
5. Loop through this layer, pop out one element each time, and do some stuff about this element, such as add to a tracing record.
6. Then add the relevant nodes of this node into the queue.
7. At the end of iteration of the while loop, do something about this visited layer, such as add to the tracing record.
8. Return the result
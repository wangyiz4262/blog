title: Run-Length Encoding algorithm for Strings
date: 2015-02-04 16:52:31
categories:
- Coding
tags:
- leetcode
- data structure
---
![](/img/leetcode-string.png)
Imagine we need to compress a string “1111422311” into “4114221321”, which means “four ones, one four, two twos, one three, two ones”. Here is the implementation for this functionality:
```java
public String compress(String str)  {
    if (str == null || str.length() == 0) {
        return null;
    }
 
    StringBuffer result = new StringBuffer();
    int stringIndex = 0;
 
    while (stringIndex < s.length()) {
        int counter = 0;
        char digit = s.charAt(stringIndex);
        while (stringIndex < s.length() && digit == s.charAt(stringIndex)) {
            counter++;
            stringIndex++;
        }
 
        result.append(counter);
        result.append(digit);
    }
 
    return result.toString();
}
```
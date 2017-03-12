title: Iterations in JavaScript Promise
categories:
  - Languages
tags:
  - javascript
  - promise
  - recursion
date: 2017-03-11 22:46:43
---
![](/img/2017/03/promise.png)
Imagine we have an async task below that needs to be done for several times in sequence. 
```javascript
function asyncJob() {
    for (var i = 0 ; i < 4;) {
        console.log(i++);
        setTimeout(function() {
            console.log(`${i} second has passed.`);
        }, 1000);
    }
}
```

However the result will be like:
```
0
1
2
3
4 second has passed.
4 second has passed.
4 second has passed.
4 second has passed.
```

This is due to the fact that the async part will be pushed to the execution stack, which is yet to be run. And when it starts to run, the incrementer has become 4.

A simple solution might be changing `var i` to be `let i`:
```javascript
function asyncJob() {
    for (let i = 0 ; i < 4;) {
        console.log(i++);
        setTimeout(function() {
            console.log(`${i} second has passed.`);
        }, 1000);
    }
}
```

The new keyword `let` will work on the block level and somehow make sure the variable in the block is properly assigned with the correct value:
```
0
1
2
3
1 second has passed.
2 second has passed.
3 second has passed.
4 second has passed.
```

But `setTimeout` still runs at the end. What if I want the output is like this without changing the codes within the loop?
```
0
1 second has passed.
1
2 second has passed.
2
3 second has passed.
3
4 second has passed.
```

An approach might be using Promise, and all operations will be wrapped by Promise:
```javascript
function asyncJob() {
    let i = 0;
    return Promise.resolve()
        .then(() => {
            return new Promise((resolve) => {
                console.log(i++);
                setTimeout(function() {
                    resolve(`${i} second has passed.`);
                }, 1000);
            });
        })
        .then(console.log)
        /* repeated several times*/
        .then(() => {
            return new Promise((resolve) => {
                console.log(i++);
                setTimeout(function() {
                    resolve(`${i} second has passed.`);
                }, 1000);
            });
        })
        .then(console.log);
}
```

The result finally is what I are expecting. And key part, which makes sure the incrementer and time passed will print together, is returning a new Promise within each `.then()` method. It will not proceed to the next `.then()` until this Promise is fulfilled, meaning either resolved or rejected.

And of course we can write 4 or even more `.then()` methods to contain them, but this is definitely not an optimal solution. A better approach might be using recursion.

```javascript
var i = 0
  , asyncJob = function() {
        return Promise.resolve()
        .then(() => {
            return new Promise((resolve) => {
                console.log(i++);
                setTimeout(function() {
                    resolve(`${i} second has passed.`);
                }, 1000);
            });
        })
        .then(console.log)
        .then(() => {
            if (i < 4) {
                asyncJob();
            }
        })
};

asyncJob();
```

Here is another a small trick. We can take advantage of the `.catch()` method in Promise to skip the following `.then()`s.
```javascript
var i = 0
  , asyncJob = function() {
        return Promise.resolve()
        .then(() => {
            if (i === 4) {
                return Promise.reject('Done with promise');
            } else {
                return new Promise((resolve) => {
                    console.log(i++);
                    setTimeout(function() {
                        resolve(`${i} second has passed.`);
                    }, 1000);
                });
            }
        })
        .then(console.log)
        .then(asyncJob)
        .catch(err => {
            if (err === 'Done with promise') {
                return Promise.resolve();
            } else {
                return Promise.reject(err);
            }
        });
};

asyncJob();
```

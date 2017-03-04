title: A simple timeout mechanism for Promise
categories:
  - Coding
tags:
  - javascript
  - promise
date: 2017-03-03 21:01:42
---
![](/img/2017/03/promise.png)

Sometimes we need to do some asynchronous jobs which may last for a while, like submitting an Ajax POST request. And if there is problem with connection, we may not get response in time as expected. Therefore we need a mechanism to detect timeout so as to avoid endless waiting or even worse situation.

Here is a simple implementation of such mechanism:

```javascript
const delayedOperation = function() {
    const asyncPromise = Promise.resolve()
            .then(() => {
                resolve(doStuffAsync());
            })
        , delayedPromise = new Promise((resolve, reject) => {
            setTimeout(() => {
                console.log('timeout');
                reject('Timeout');
            }, 10000);
        });
    return Promise.race([openUrlPromise, delayedPromise]);
};

delayedOperation()
.then(console.log)
.catch(console.log);
```

But story does not end here. When running this codes, even though `asyncPromise` does not last for more than 10000 ms, it will still give me a `timeout` console output.

Shouldn't the `Promise.race` just return `asyncPromise` and skip `delayedPromise`?

Answer is YES and NO.

When `asyncPromise` is fulfilled ahead of `delayedPromse`, indeed `Promise.race` will return `asyncPromise`, but `delayedPromise` will not just terminate. Instead, because of the `setTimeout()`, `delayedPromise` will be queued on the execution context and waited to complete. So at some point it will still give an output on the console.

This is not some happy ending we would like see. To remedy this, a simple solution is of course not adding any additional codes except `reject()` inside the `setTimeout()`.

Another shortcoming for this method is the `setTimeout` will drag the completion of the entire program onward. Therefore you may notice that the memory is not freed even though all operations have completed.
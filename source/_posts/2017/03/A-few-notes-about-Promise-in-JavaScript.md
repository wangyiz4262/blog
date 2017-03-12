title: Rejection in Promise
categories:
  - Languages
tags:
  - javascript
  - promise
date: 2017-03-02 23:26:06
---
![](/img/2017/03/promise.png)

I am always curious that if a Promise is rejected at any position, will the following then() still be executed? Consider the following codes as an example:

```javascript
Promise.reject('rejected')
.then(() => {
    console.log('before resolve()');
    return Promise.resolve('resolved');
})
.then((msg) => {
    console.log('resolved inside 1st then()');
    console.log(`Resolved: ${msg}`);
}, (msg) => {
    console.log('rejected inside 1st then()');
    console.log(`Rejected: ${msg}`);
})
.then((msg) => {
    console.log('resolving inside 2nd then()');
    console.log(`Resolved: ${msg}`);
}, (msg) => {
    console.log('rejecting inside 2nd then()');
    console.log(`Rejected: ${msg}`);
})
.catch((msg) => {
    console.log('rejected in catch()');
    console.log(`Rejected: ${msg}`);
});
```

Result:

```
rejected inside 1st then()
Rejected: rejected
resolving inside 2nd then()
Resolved: undefined
```

It is clear that the rejection was caught in the second `then()`, and `Promise.resolve()` was not even executed. But once the rejection is caught in some place, everything went back to normal.

Therefore to ensure that once rejected, the whole process stops running until termination, we should put a `catch()` method at the very end and do not catch the `reject()` inside any `then()` before it.
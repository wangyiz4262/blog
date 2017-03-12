title: Classes in the new ES6 standard
categories:
  - Languages
tags:
  - javascript
  - es6
  - data structure
date: 2017-03-11 10:15:17
---
![](/img/2017/03/es6.png)

Class is a new feature introduced into the new ECMAScript 2015 standard, also known as ES6.

I thought it was just a move for the JavaScript to adapt to the Object-oriented world. It may be so, however, I found with the declaration of classes, I became more clear about several concepts that confused me a lot in the functional world.

First, a class in JS is still a function, which also exemplifies the idea that functions are first-class citizen in the JS world.

```javascript
class Foo {
    constructor() {
        this.foo = function() {
            console.log('foo');
        };
    }
    bar() {
        console.log('bar');
    }
}
```
```bash
>> console.log(typeof Foo)
'function'
```

Second, we know that an important concept in JS is prototype. We were told that it is better for an object to inherit a function from its prototype instead of defining inside the constructor, e.g.

```javascript
var Foo = function() {
    this.foo = function() {
        console.log('foo');
    };
};

Foo.prototype.bar = function() {
    console.log('bar');
};
```

The `bar` method was defined in the prototype of `Foo`, and will be attached everytime `Foo` is instantiated. In the new ES6 standard, we can also define prototype methods. We only need to write them inside the class definition but outside the constructor function, like the first example shows.

And as explained by the name, `constructor` function inside class definition is the constructor which will be used to instantiate an object.

So we got the idea. The new class data structure is just an abstract encapsulation of our previous practices with functions. We can define constructors and prototypes all inside this class.

Third, we also know that everything in JS are objects, including functions. We can even attach properties to a function like the following:

```javascript
var Foo = function() {
    this.foo = function() {
        console.log('foo');
    };
};

Foo.yo = function() {
    console.log('yo!');
};
```

See, this is different from the `bar` method, which is bound to the prototype of `Foo`. This `yo` method is bound directly to `Foo` as an object property. 

How do we call this function? Simple. Instead of instantiating an object first, we just call it directly like this:

```bash
>> Foo.yo();
yo!
```

But if we get an instance of `Foo` and call `yo` against that instance, we will get an error:

```bash
>> var obj = new Foo();
>> obj.yo();
TypeError: obj.yo is not a function
```

This is pretty similar to the static methods in the Object-oriented world. That's right! To define a such function within a class definition, we only need to add a 'static' keyword in front of the function:

```javascript
class Foo {
    constructor() {
        this.foo = function() {
            console.log('foo');
        };
    }
    bar() {
        console.log('bar');
    }
    static yo() {
        console.log('yo!');
    }
}
```

Finally, how do we actually call this functions?

For functions defined inside constructor, of course we need to instantiate an object, and same goes for function defined on prototype:

```javascript
>> var obj = new Foo();
>> obj.foo()
foo
>> obj.bar()
bar
```

The static methods should be called directly with the class name as explained already: `Foo.yo()`.
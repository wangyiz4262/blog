title: Expression vs. Statement
date: 2015-10-08 15:08:15
categories:
- Languages
---
There are a lot of explanations online for distinguishing those two concepts. As in the answers of [this question](http://stackoverflow.com/questions/4728073/what-is-the-difference-between-an-expression-and-a-statement-in-python) says,

> - **[Expressions](http://docs.python.org/reference/expressions.html)** only contain [identifiers](http://docs.python.org/release/2.5.2/ref/identifiers.html), [literals](http://docs.python.org/release/2.5.2/ref/literals.html) and [operators](http://docs.python.org/release/2.5.2/ref/operators.html), where operators include arithmetic and boolean operators, the function [call operator](https://docs.python.org/3/reference/expressions.html?highlight=subscriptions#calls) `()` the [subscription operator](https://docs.python.org/3/reference/expressions.html?highlight=subscriptions#grammar-token-subscription) `[]` and similar, and can be reduced to some kind of "value", which can be any Python object.
> - **Statements** (see [1](https://docs.python.org/3/reference/expressions.html?highlight=subscriptions#calls), [2](https://docs.python.org/3/reference/expressions.html?highlight=subscriptions#grammar-token-subscription)), on the other hand, are everything that can make up a line (or several lines) of Python code. Note that expressions are statements as well.

It is quite confusing to me actually. So I find the simplest way to distinguish those two is that expressions are just a part of statements. An expression represents some operation, but it cannot be executed solely by the compiler.
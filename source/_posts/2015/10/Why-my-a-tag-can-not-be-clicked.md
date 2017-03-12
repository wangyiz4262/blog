title: 'Why my <a> tag can not be clicked'
categories:
  - Development
tags:
  - html & css
date: 2015-10-19 12:26:15
---
![](/img/2015/10/html-anchor-tag.png)

I wrote some codes below:
```html
<body>
  <div class="container">
  <a href="../index.html" id="return"><button class="btn">Return</button></a>
  <h1 id="toc_0">Typography</h1>
```

When I rendered the html, to my surprise, the button was not clickable, neither could I select any text on it.
![](/img/2015/10/html-position-absolute-z-index.png)

This is interesting. So I looked back at the css associated with this tag, which wrote as following:
```css
#return {
    position: absolute;
    right: 0;
    top: 20px;
}
```

I set the position as absolute, and at the same time I set the parent div with position relative, in which way I'd like to make the button floating right. The button is displaying correctly, with correct color and shape. Nothing seemed wrong, except it could not be clicked.

If I move the `<h1>` tag above the `<a>` tag, the button can be clicked now. So a good guess is that the `<a>` tag was overlapped by `<h1>`, because it appeared before `<h1>` while was positioned in the same block as `<h1>` at the same time. As a result, the `<a>` tag was covered by the `<h1>`.

To solve this problem, we simply need to add another `z-index` to the css property of `<a>` as following:
```css
#return {
    z-index: 10;
    position: absolute;
    right: 0;
    top: 20px;
}
```

Now the button can be clicked and the pages is not messed up as well.

An answer on [StackOverflow](http://stackoverflow.com/a/10663419) also stated a similar problem.
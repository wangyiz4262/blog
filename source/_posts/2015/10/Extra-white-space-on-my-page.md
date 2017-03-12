title: Extra white space on my page
categories:
  - Development
tags:
  - html & css
date: 2015-10-21 15:17:31
---
I recently created a [new site](http://wangyizhe.net/cheatsheets), collecting some useful cheatsheets. But on the [page](http://wangyizhe.net/cheatsheets/markdown) regarding to topic of Markdown, a funny thing happened without giving me any clue of why. There was some empty space on the right-hand-side of screen.

![](/img/2015/10/html-white-space-on-the-right-side-of-page.png)

It haunted me for several days. I tried out may possibilities, from screen size of iPhone 6 Plus, to 3-pixels-in-1 Retina Display issue, to viewport settings in meta tag, to disable and re-enable overflow property in css, etc. None of them worked, until I scroll it way down to the bottom and discovered a remarkably long line of code.

![](/img/2015/10/html-extra-long-line.png)

There is the little devil!!!

After changing this part, and refresh the page, the world is in peace...

What a stupid mistake! But that's the sort of things humans always do.

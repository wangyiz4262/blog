title: Build personal blog with Hexo Part 1
date: 2015-09-25 15:13:01
categories: 
- Tutorial
tags: 
- markdown
---
![](/img/blog-hexo.png)

## <p align="center">Part 1: Install Hexo</p>
### Preface
Building personal blogs has never been easier.

There are a lot of good choices, free of charge, like blogspot, Sina blog, wordpress.com, etc. But I want something clean, self maintained, without annoying ads. Hmm, seems tougher, but still viable. I need to purchase some VPS space, purchase a domain name, download Wordpress framework from wordpress.org, read a lot of tutorials, and install it. Horray, after days' effort, I am finally on my way! But, I do not feel like writing a single word after all these efforts now...

Can I still have blog totally controlled by myself, without ads, without spending a penny? Yes, here comes [Hexo](https://hexo.io/), an interesting project from a young man in Tainwan.

### Instructions
If you follow this tutorial, it should not take you more than a hour to finish the whole process.

#### Basic idea
The basic idea of using Hexo for building free blogs is to take advantages of several web-based Git repository hosting service, such as GitHub, Bitbucket, GitCafe, etc. They are not only providing source control services, but also providing a service of hosting webpages as a server.

You will need to creat a new repository, then push your codes to a specific page branch, and done! For example, if you are using GitHub, you only need to push your front-end codes to the branch "gh-pages" of your new repository. The branch name for GitCafe is "gitcafe-pages". Technically, you can create unlimited sites with this technique.

The language for writing Hexo blogs is Markdown. A very intuitive language for text writing. The syntax is quite simple which almost without any burden of studying. A more detailed explanation can be found [here](https://en.wikipedia.org/wiki/Markdown).

There are also a lot of good tutorials online. [This one](http://www.jianshu.com/p/q81RER), for example, shows the most frequently used syntax you may come across.

#### Install neccessary parts
There are two software needs to be install ahead, which are Node.JS and Git:
1. Download and install Node.JS at official website [here](https://nodejs.org/en/)
2. Download and install Git at official website [here](https://git-scm.com/downloads)
You may find detailed installation instruction on the website above.

#### Install Hexo
If you are using Windows, then you will have Git Bash installed when you were installing Git just now. Open it.
If you are using Mac or Linux, you can directly open the Terminal app, and enter the following:
```bash
$ npm install -g hexo
```

> <b>Heads up</b>
> If you see some error like "-bash: npm: command not found", then the problem is the directory containing <code>node.exe</code> was not properly added into the environment variables of your operating system. You may refer to tutorial [here](http://www.computerhope.com/issues/ch000549.htm) are how to set the path and environment variables in Windows. For Mac uses, [this post](http://osxdaily.com/2015/07/28/set-enviornment-variables-mac-os-x/) should have explained very clearly. And I believe Linux users should well know how to set system environment variables.

#### Initiate your blog

Now go to any directory you like, say <code>D:\blog</code>. If you are using Windows, press down Shift key, and right click on empty area, select <code>Open command window here</code> in the pop-up menu. If you are using Mac or Linux, just open Terminal and direct to the directory you specified. Then enter following codes:
```bash
$ hexo init
$ npm install
$ npm install hexo-deployer-git --save
```

And now, you have a preliminary blog set up. You may run following codes to view the result:
```bash
$ hexo g
$ hexo s
```

You will see a line of code says 
```bash
INFO  Hexo is running at http://0.0.0.0:4000/. Press Ctrl+C to stop.
```
Then you only need to open [http://localhost:4000](http://localhost:4000) in your browser, and welcome to your new blog!

![](/img/blog-theme-landscape.jpg)

To Be Continued ...

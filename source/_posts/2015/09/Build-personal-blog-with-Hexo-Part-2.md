title: Build personal blog with Hexo Part 2
date: 2015-09-26 14:18:31
categories: 
- Tutorial
tags: 
- markdown
- hexo
---
![](/img/blog-dnspod.jpg)

## <p align="center">Part 2: Deploy to GitHub</p>
### Configure GitHub
1. In the upper-right corner of any page, click **+**, and then click **New repository**.
![](/img/blog-github-repo-create.png)

2. Enter name for your blog project, which must be following this pattern: &lt;username&gt;.github.io
![](/img/blog-github-repo-name.png)

3. Click **Create repository**.
![](/img/blog-github-create-repo-button.png)

Congratulations! You've successfully created your blog repository!

### Generate SSH keys


### Settings on Hexo

```
deploy:
  type: git
  message: [message]
  repo:
    github: <repository url>,[branch]
    gitcafe: <repository url>,[branch] 
```

### DNS resolution
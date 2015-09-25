alias new='hexo new'
alias view='hexo genereate; hexo server'
alias publish='hexo generate; hexo deploy'

function push {
    git add source/_posts/*
    git commit -m "$(date +%m/%d/%Y %H:%M %Z)"
    git push
}

function del {
    if [ ! -z "$1" ]; then
      arg=$(echo $1)
      filename=$(echo ${arg/\ /-})
      mv source/_posts/"$filename".md source/_trash/
      mv source/_posts/"$filename"/ source/_trash/
      echo "post '$arg' is deleted"
    fi
}

function restore {
    if [ ! -z "$1" ]; then
      arg=$(echo $1)
      filename=$(echo ${arg/\ /-})
      mv source/_trash/"$filename".md source/_posts/
      mv source/_trash/"$filename"/ source/_posts/
      echo "post '$arg' is restored"
    fi
}

function empty {
    rm -rf source/_trash/*
}

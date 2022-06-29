# GIT: Operations
## Gitflow:
```html
https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
```

## Rebase
Rebase `main` onto `feature`:
```sh
git checkout feature
git rebase main
git pull --rebase # or git push -f
git push
```

## Revert to commit:
```bash
git revert --no-commit 0766c053..HEAD
git commit
```
## Beyond Compare
```html
http://www.scootersoftware.com/download.php?zz=kb_linux_install
```
## Simple Compare
```bash
git diff HEAD^ HEAD Makefile
```
## Dependencies access
In file `~/.gitconfig`:
```yaml
[url "git@github.com:"]
        insteadOf = https://github.com/
```

## Resources
```
https://nitayneeman.com/posts/understanding-semantic-commit-messages-using-git-and-angular/
https://www.toptal.com/front-end/guide-to-monorepos
https://www.devroom.io/2009/10/26/how-to-create-and-apply-a-patch-with-git/
https://www.devroom.io/2020/03/09/the-git-submodule-cheat-sheet/
https://www.youtube.com/watch?v=__cR7uPBOIk
https://phoenixnap.com/kb/how-to-resolve-merge-conflicts-in-git
https://www.w3docs.com/snippets/git/how-to-change-commit-message.html
```

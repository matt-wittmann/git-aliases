#!/bin/sh

# At my present employer, we use a variant of GitFlow
# (https://nvie.com/posts/a-successful-git-branching-model/)
# but using kanban and something resembling continuous delivery.
# User story development, though, is typically long-lived enough
# that milestone branches for faster code review make sense.

# Cut a release by merging the latest develop into master and pushing to origin
git config --global alias.release '!git checkout develop && git pull && git checkout master && git pull && git merge develop && git push && git checkout develop'

# Open a main feature branch: git feature card-number descriptor
git config --global alias.feature '!git checkout develop && git pull && git checkout -b "feature/$1-$2" && git push --set-upstream origin "feature/$1-$2" #'

# Open a main hotfix branch: git hotfix card-number descriptor
git config --global alias.hotfix '!git checkout develop && git pull && git checkout -b "hotfix/$1-$2" && git push --set-upstream origin "hotfix/$1-$2" #'

# Open a milestone branch off the current branch
git config --global alias.milestone '!git checkout -b "$(git rev-parse --abbrev-ref HEAD)--$1" && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD) #'


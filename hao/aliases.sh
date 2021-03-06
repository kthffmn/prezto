bindkey -e

# Global aliases. ####################
alias -g .l='|& less -FRX'
alias -g .b='$(git branch | fzf +s +m)'
alias -g .rb='$(git branch -r | sed "s/origin\///" | fzf +s +m)'
alias -g .log='$(git log --pretty=oneline --abbrev-commit -20 | fzf +s --prompt="fixup> " | awk ''{ print $1 }'')'
alias -g .json='-H "Content-type: application/json"'
alias -g .nb='--no-build'
alias -g .ne='--no-edit'
alias -g .w='--ghc-options="-Wall -Werror"'
alias -g .gc='--fast --ghc-options="-j3 +RTS -A256m -n16m -gq -RTS"'
alias -g .gd='--ghc-options="-j +RTS -A128m -RTS -O2"'
alias -g .fw='--file-watch'
alias -g .bb='$(git rev-parse --abbrev-ref HEAD)'
alias -g .rbb='$(git for-each-ref --format="%(upstream:short)" $(git symbolic-ref -q HEAD))'
alias -g .f='--force-with-lease'

alias l='ls -Fha'
alias ll='l -l'
alias reload='. ~/.zshrc'
alias v='vim'
alias xargsi="xargs -I {}"
alias brewup="brew update; brew upgrade; brew cleanup"
alias dc="docker-compose"
alias stackup='curl -sSL https://get.haskellstack.org/ > /tmp/a.sh && chmod +x /tmp/a.sh && /tmp/a.sh --force'

alias recask='pushd ~/.emacs.d && cask build && popd'

alias dgit='git --git-dir ~/dotfiles/.git'
alias egit='git --git-dir ~/.emacs.d/.git'

alias am='git commit --amend -pv'
alias ci='git commit -v'
alias cip='git commit -pv'
alias cia='git commit -av'
alias co='git checkout'
alias cod='git checkout develop'
alias com='git checkout master'
alias p='git pull'
alias pr='git pull --rebase'
alias s='git status -s'
alias r='git rebase'
alias ri='git rebase -i'
alias rc='git rebase --cont'
alias gcp='git cherry-pick'
alias d="git diff"
alias dd="git diff --cached"
alias sigh="git remote"

alias gl="git log --graph --pretty=format:'%w(100,0,10)%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -20"
alias gll="gl --all -10000 --not origin/gh-pages"
alias gpr="git pull --rebase"
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias grz='git reset --soft HEAD^ && git reset HEAD .'

alias upd="git fetch --all && git fetch -v origin develop:develop && git remote -v prune origin"
alias up="git fetch --all && git fetch -v origin master:master && git remote -v prune origin"
alias uph="git fetch --all && git fetch -v origin master:master hatchery:hatchery && git remote -v prune origin"
alias show="git show"

alias util='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''

# Get CPU request total (we x20 because because each m3.large has 2 vcpus (2000m) )
alias cpualloc='util | grep % | awk '\''{print $1}'\'' | awk '\''{ sum += $1 } END { if (NR > 0) { print sum/(NR*20), "%\n" } }'\'''

# Get mem request total (we x75 because because each m3.large has 7.5G ram )
alias memalloc='util | grep % | awk '\''{print $5}'\'' | awk '\''{ sum += $1 } END { if (NR > 0) { print sum/(NR*75), "%\n" } }'\'''

hash -d w=~/w/dashboard
hash -d work=~/w
hash -d lab=~/lab
hash -d m=~/m
hash -d p=~/.zprezto

alias ee='open -a /Applications/Emacs.app'
alias o='cd ~/w/o'
alias tf='cd ~/w/o/mobile/ios; export MATCH_USERNAME="insights@haolian.org"; export PILOT_USERNAME="insights@haolian.org"; echo .env.prod > /tmp/envfile; bundle exec fastlane testflight'
alias y='yarn --silent'
alias rg='rg --hidden'
alias bother='hub pull-request'

function gimme {
  while ! nc -z 127.0.0.1 "$1"; do
    sleep 0.5
  done
}

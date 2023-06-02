# git
abbr -a -U -- ga 'git add .'

abbr -a -U -- gp 'git push origin (git rev-parse --abbrev-ref HEAD)'
abbr -a -U -- gpf 'git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease'
abbr -a -U -- gta 'git push origin (git rev-parse --abbrev-ref HEAD) && git push origin (git describe --tags)'

abbr -a -U -- gpl 'git pull origin (git rev-parse --abbrev-ref HEAD)'

abbr -a -U -- gl 'git log --oneline'

abbr -a -U -- gc 'git commit -m'
abbr -a -U -- gfeat 'git commit -m "feat:'
abbr -a -U -- gfix 'git commit -m "fix:'
abbr -a -U -- gchore 'git commit -m "chore:'

abbr -a -U -- gs 'git switch'
abbr -a -U -- gsd 'git switch develop'
abbr -a -U -- gsm git\ switch\ \(git\ remote\ show\ origin\ \|\ grep\ \'HEAD\ branch\'\ \|\ awk\ \'\{print\ \$NF\}\'\)
abbr -a -U -- gsc 'git switch -c'
abbr -a -U -- gca 'git commit --amend'

abbr -a -U -- gst 'git stash -u'
abbr -a -U -- gsa 'git stash apply'

abbr -a -U -- gsf 'git branch -a | fzf | xargs git switch'

abbr -a -U -- ghpr 'gh pr checkout'

abbr -a -U -- rmn 'rm -rf node_modules && narn'
abbr -a -U -- rmnode 'rm -rf node_modules'

# yarn,npm,pnpm
# https://github.com/antfu/ni
abbr -a -U -- y 'ni'
abbr -a -U -- ya 'ni -D'
abbr -a -U -- yd 'nr dev'
abbr -a -U -- yu 'nu'
abbr -a -U -- yui 'nu -i'
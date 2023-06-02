# git
abbr -a ga 'git add .'

abbr -a gp 'git push origin (git rev-parse --abbrev-ref HEAD)'
abbr -a gpf 'git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease'
abbr -a gta 'git push origin (git rev-parse --abbrev-ref HEAD) && git push origin (git describe --tags)'

abbr -a gpl 'git pull origin (git rev-parse --abbrev-ref HEAD)'

abbr -a gl 'git log --oneline'

abbr -a gc 'git commit -m'
abbr -a gfeat 'git commit -m "feat:'
abbr -a gfix 'git commit -m "fix:'
abbr -a gchore 'git commit -m "chore:'

abbr -a gs 'git switch'
abbr -a gsd 'git switch develop'
abbr -a gsm git\ switch\ \(git\ remote\ show\ origin\ \|\ grep\ \'HEAD\ branch\'\ \|\ awk\ \'\{print\ \$NF\}\'\)
abbr -a gsc 'git switch -c'
abbr -a gca 'git commit --amend'

abbr -a gst 'git stash -u'
abbr -a gsa 'git stash apply'

abbr -a gsf 'git branch -a | fzf | xargs git switch'

abbr -a ghpr 'gh pr checkout'

abbr -a rmn 'rm -rf node_modules && narn'
abbr -a rmnode 'rm -rf node_modules'

# yarn,npm,pnpm
# https://github.com/antfu/ni
abbr -a y 'ni'
abbr -a ya 'ni -D'
abbr -a yd 'nr dev'
abbr -a yu 'nu'
abbr -a yui 'nu -i'
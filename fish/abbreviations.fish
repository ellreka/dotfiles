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

abbr -a gsf "git branch --sort=-committerdate --format='%(refname:short) | %(contents:subject)' | fzf --preview 'git log --oneline --graph --decorate --color=always \$(echo {} | cut -d \" \" -f1)' | cut -d ' ' -f1 | xargs git switch"
abbr -a ghc 'gh pr checkout'
abbr -a ghp 'gh pr list'
abbr -a ghs "gh pr list | fzf | awk '{print \$1}' | xargs gh pr checkout"

abbr -a rmn 'rm -rf node_modules && narn'
abbr -a rmnode 'rm -rf node_modules'

# yarn,npm,pnpm
# https://github.com/antfu/ni
abbr -a y 'ni'
abbr -a ya 'ni -D'
abbr -a yd 'nr dev'
abbr -a yu 'nu'
abbr -a yui 'nu -i'

# flutter
abbr -a f 'fvm flutter'
abbr -a fp 'fvm flutter pub'
abbr -a fr 'make run DEVICE_ID='
abbr -a fra 'make run DEVICE_ID=emulator-5554'
# abbr -a fr 'fvm flutter run -d 07799682-C348-4953-891D-1DFAF89303BE --dart-define-from-file=main_define_from_file.json'
# abbr -a fr-and 'fvm flutter run -d emulator-5554 --dart-define-from-file=main_define_from_file.json'

call plug#begin('~/.vim/plugged')
" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" コメントアウト
Plug 'tpope/vim-commentary'
" ステータスバー
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" html
Plug 'gorodinskiy/vim-coloresque'
Plug 'cohama/lexima.vim'
Plug 'rhysd/accelerated-jk'
Plug 'tpope/vim-fugitive'
call plug#end()

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" インデントはスマートインデント
set smartindent
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" タブ移動
nnoremap <Tab> gt
" sで右に移動
nnoremap s l
vnoremap s l
snoremap s l

" search
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" プラグイン設定

" nerdtree
" ファイル指定せずにvimを開いたときだけ起動する
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" dotfileを表示
let NERDTreeShowHidden=1
" 表示非表示の切り替え
nnoremap <silent> <C-e> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" theme molokai
syntax on
colorscheme molokai
set t_Co=256

" vim-airline
let g:airline_theme = 'molokai'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
set ttimeoutlen=50

" ale
let b:ale_linters = ['eslint']
" 保存時に実行
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" クリップボードからペーストしたときにインデントしない
" if &term =~ "xterm"
"     let &t_SI .= "\e[?2004h"
"     let &t_EI .= "\e[?2004l"
"     let &pastetoggle = "\e[201~"

"     function XTermPasteBegin(ret)
"         set paste
"         return a:ret
"     endfunction

"     inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
" endif

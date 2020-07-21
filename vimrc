" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

syntax on

" Prevent incorrect backgroung rendering
let &t_ut=''

" Better backspace
set backspace=indent,eol,start

set completeopt-=preview

set ts=4
set nu
set nosmartindent
set softtabstop=4
set shiftwidth=4
set autoindent
set cursorline
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set foldmethod=indent
set foldlevel=99
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


noremap i k
noremap k j
noremap j h
noremap h i
noremap H I
noremap I 5k
noremap K 5j
noremap <C-j> 0
noremap <C-l> $

map C :nohlsearch<CR>
map s <nop>
map Q :q!<CR>
map R :source $MYVIMRC<CR>
map ; :

map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>

map qi <C-w>k
map qk <C-w>j
map qj <C-w>h
map ql <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map ti :tabe<CR>
map tl :tabnext<CR>
map tj :tabprevious<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

call plug#begin()
" Vim Status bar
Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Auto Complete
Plug 'ycm-core/YouCompleteMe'

" Error checking
Plug 'dense-analysis/ale'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'junegunn/goyo.vim' 			" distraction free writing mode
Plug 'tpope/vim-surround' 			" type ysks' to wrap the word with '' or type cs'`to change 'word' to `word`
Plug 'godlygeek/tabular' 			" type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' 			" in Visual mode, type i' to select all text in '',or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' 	" in <space>cc to comment a line

" Dependencies
Plug 'fadein/vim-FIGlet'

call plug#end()
 
" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMapOpenSplit = "h"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeMapJumpFirstChild = "J"
let NERDTreeMapJumpLastChild = "L"
let NERDTreeMapJumpNextSibling = "<C-l>"
let NERDTreeMapJumpPrevSibling = "<C-j>"
let NERDTreeMenuDown = ""
let NERDTreeMenuUp = ""

" ===
" === NERDTree-git
" ===
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : "☒",
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1 

" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif " 离开插入模式后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_complete_in_comments=1                   		" 补全功能在注释中同样有效
let g:ycm_complete_in_strings=0							" 在字符串输入中也能补全
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_confirm_extra_conf=0                     		" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1    		" 开启 YCM 标签补全引擎
let g:ycm_cache_omnifunc=0                         		" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1           		" 语法关键字补全
let g:ycm_goto_buffer_command = 'vertical-split'   		" 跳转打开左右分屏
let g:ycm_seed_identifiers_with_syntax=0				" 语法关键字补全
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_error_symbol = '✗'							" 同时，YCM可以打开location-list来显示警告和错误的信息:YcmDiags
let g:ycm_warning_symbol = '⚠'


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === Taglist
" ===
map T :TagbarOpenAutoClose<CR>

" ===
" " === vim-indent-guide
" " ===
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 1
" silent! unmap <LEADER>ig
" autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>






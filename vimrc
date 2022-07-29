call pathogen#infect('~/.vim/bundle/{}')

if has("gui_running")
else
  call pathogen#infect('~/.vim/bundlecli/{}')
endif

" Configuraciones para trabajar con latex.
"
"Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

"Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

setlocal spell
set spelllang=es
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" Nocompatible mode
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

syntax enable

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

au BufWrite * :silent !touch /tmp/BufWrite

autocmd BufNewFile,BufRead *.md set filetype=markdown

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" Highlight the line the cursor is on
autocmd FileType markdown set cursorline
" Set spell check to British English
autocmd FileType markdown setlocal spell spelllang=es

set modelineexpr 

" Goyo Escribir sin distracciones
"nnoremap <C-g> :Goyo<CR>

" Configuration for vim-markdown
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1
let g:markdown_folding = 1

" Have lines wrap instead of continue off-screen
" set linebreak

" Converts tabs to spaces
set expandtab

" Use two spaces instead of tabs
set tabstop=2

" The same but for indents
set shiftwidth=2

" Keep cursor in approximately the middle of the screen
set scrolloff=12

" Disable mouse support
" set mouse=

" Insert timestamp at the end of the line in this format: 20200527T113245
nnoremap <C-t><C-t> m'A<C-R>=strftime(' %Y%m%dT%H%M%S')<CR>

"------------------------------------------------------------------------------
" Colors and Fonts
"------------------------------------------------------------------------------

" Enable syntax highlighting
syntax enable

" set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" add vertical lines on columns
set colorcolumn=80,120

"------
" Set leader and fast save
"------
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file

let mapleader = ","
let g:mapleader = ","

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" This is totally awesome - remap jjj to escape in insert mode.  You'll never type jjj anyway, so it's great!
" I will type jj, I'm jj
"inoremap jjj <esc>
"nnoremap JJJJ <nop>

" Turn on the WiLd menu
set wildmenu

" Set command-line completion mode
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number
set relativenumber
set cursorline

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Allow smarter completion by infering the case
set infercase

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
"set hlsearch

" Makes search act like search in modern browsers
"set incsearch

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
"set novisualbell
set t_vb=
set vb t_vb=
if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
endif

set tm=500



"clean GUI

set guioptions=


"------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"------------------------------------------------------------------------------
" Editing mappings
"------------------------------------------------------------------------------
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.go :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


"------------------------------------------------------------------------------
" Spell checking
"------------------------------------------------------------------------------

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sl z=


"------------------------------------------------------------------------------
" Misc
"------------------------------------------------------------------------------

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Allow to copy/paste between VIM instances
"copy the current visual selection to ~/.vbuf
vmap <leader>y :w! ~/.vbuf<cr>

"copy the current line to the buffer file if no visual selection
nmap <leader>y :.w! ~/.vbuf<cr>

"paste the contents of the buffer file
nmap <leader>p :r ~/.vbuf<cr>

" Make sure that CTRL-A (used by gnu screen) is redefined
noremap <leader>inc <C-A>

"------------------------------------------------------------------------------
" Custom color scheme
"------------------------------------------------------------------------------
try
    colorscheme foursee "delek 
catch
endtry

"-------------------
" Algunos remaps
"-------------------

nnoremap <Space>ff :e<Space>
nnoremap <Space>wq :q
nnoremap <Space>bq :bdelete

inoremap :w <C-\><C-o>:w<CR>

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent !grep -I -r -n --exclude "*.{json,pyc}" . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>

"---------
" Vim pandoc
" --------

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

"	citation.vim
"	csv.vim
"	goyo.vim
"	jedi-vim
"	jupyter-vim
"	jupytext.vim
"	latex-unicoder.vim
"	theme-foursee
"	unite.vim
"	vim-pandoc-syntax
"	zettel
"cli	CSApprox

""" Vim para prosa (ponele)

let w:ProseModeOn = 0

function EnableProseMode()
	setlocal spell
	Goyo 66
	SoftPencil
	echo "Prose Mode On"
endfu

function DisableProseMode()
	Goyo!
	NoPencil
	setlocal nospell
	echo "Prose Mode Off"
endfu

function ToggleProseMode()
  let w:ProseModeOn = get(w:, 'ProseModeOn', 0)
	if w:ProseModeOn == 0
		call EnableProseMode()
		let w:ProseModeOn = 1
	else
		call DisableProseMode()
	endif
endfu

command Prose call EnableProseMode()
command UnProse call DisableProseMode()
command ToggleProse call ToggleProseMode()

function ScratchBufferize()
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
endfu

"nnoremap <Leader>d :new \| read ! sdcv <C-R><C-W> <CR>:call ScratchBufferize() <CR>:normal gg<CR>
"nnoremap <Leader>t :new \| read ! moby <C-R><C-W> \| tr , '\n' <CR>:call ScratchBufferize() <CR>:normal gg2dd <CR>

nnoremap <C-g> :ToggleProse<CR>

function Transparente()
  highlight Normal ctermbg=0
  highlight EndOfBuffer ctermbg=0
  highlight ColorColumn ctermbg=0
endfu

function Wlpaste()
  let wlp = systemlist('wl-paste')
  if len(wlp) > 1
    call setreg('"',wlp)
  else
    if len (wlp) == 1
      call setreg('"',wlp[0])
    endif
  endif
endfunction

command WaylandToReg call Wlpaste()

nnoremap <C-p> :WaylandToReg<CR>p
vnoremap <C-p> :WaylandToReg<CR>p

function Wlcopy()
  call system('wl-copy',getreg('"'))
endfunction

command RegToWayland call Wlcopy()

nnoremap <C-p> :WaylandToReg<CR>p
vnoremap <C-p> :WaylandToReg<CR>p
nnoremap <C-y> :RegToWayland<CR>
vnoremap <C-y> y:RegToWayland<CR>

" Conceal Color ¿? 
hi Conceal          guibg=#585858

" Jedi-Vim
let g:jedi#completions_enabled = 0

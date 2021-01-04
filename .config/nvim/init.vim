" ---------------------------------------------
" PLUGINS 
" ---------------------------------------------
call plug#begin('~/.config/nvim/plugged')
  " add a good enough default config
  Plug 'tpope/vim-sensible'

  " themes
  Plug 'dracula/vim', { 'as': 'dracula' }

  " add a status line 
  Plug 'itchyny/lightline.vim'

  " improve navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'
	
  " add support for JavaScript
  Plug 'pangloss/vim-javascript'

  " add support for JSX
  Plug 'MaxMEllon/vim-jsx-pretty'

  " add support for TypeScript
  Plug 'HerringtonDarkholme/yats.vim'

  " add intellisense engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " add support for EditorConfig
  Plug 'editorconfig/editorconfig-vim'

  " add fuzzy search
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'

  " add NERDTree file system explorer
  Plug 'preservim/nerdtree'

  " integrate NERDTree with Git 
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " add syntax highlighting to NERDTree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " add folders/files icons
  Plug 'ryanoasis/vim-devicons'

  " auto close (X)HTML tags
  Plug 'alvan/vim-closetag'

  " add support for styled-components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " add Git info to the gutter
  Plug 'airblade/vim-gitgutter'

  " add bindings to comment stuff out
  Plug 'tpope/vim-commentary' 

  " add support for Prisma 2
  Plug 'pantharshit00/vim-prisma'

  " add support for GraphQL
  Plug 'jparise/vim-graphql'

  " add syntax highlighting to Elixir
  Plug 'elixir-editors/vim-elixir'

  " add support for Git
  Plug 'tpope/vim-fugitive'

  " add syntax highlighting to Ruby
  Plug 'vim-ruby/vim-ruby'

  " add support for Ruby on Rails development
  Plug 'tpope/vim-rails'

  " run tests within vim 
  Plug 'vim-test/vim-test'

  " add markdown preview
  function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
      if has('nvim')
        !cargo build --release --locked
      else
        !cargo build --release --locked --no-default-features --features json-rpc
      endif
    endif
  endfunction

  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

  " add snippets
  Plug 'honza/vim-snippets'
call plug#end()

" ---------------------------------------------
" VIM-SENSIBLE
" ---------------------------------------------
if &compatible
  finish
else
  let g:loaded_sensible = 1
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set backspace=indent,eol,start
set complete-=i

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" ---------------------------------------------
" GENERAL 
" ---------------------------------------------
set nowrap                  " do not wrap lines

let mapleader = "\<Space>"  " setup leader key

set smarttab
set autoindent
set smartindent

set expandtab               " convert tabs to the spaces
set tabstop=2               " how many columns a tab counts for 
set shiftwidth=2            " how many columns text is indent using reindent operations
set softtabstop=2           " how many columns are using when hitting tab in insert mode 

set termguicolors

set clipboard+=unnamedplus  " use system clipboard

set splitbelow              " move cursor to the new vertical split
set splitright              " move cursor to the new horizontal split

" ---------------------------------------------
" THEME 
" ---------------------------------------------
colorscheme dracula

" ---------------------------------------------
" LIGHTLINE 
" ---------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" ---------------------------------------------
" FZF 
" ---------------------------------------------
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>C :Commits<CR>

" ---------------------------------------------
" RG 
" ---------------------------------------------
nnoremap <silent> <Leader>u :Rg <C-R><C-W><CR>

" ---------------------------------------------
" NERDTREE 
" ---------------------------------------------
noremap <silent> <leader><tab> :NERDTreeToggle<CR>

" display hidden files
let NERDTreeShowHidden=1

" ---------------------------------------------
" CLOSETAG 
" ---------------------------------------------
let g:closetag_close_shortcut = ''
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" ---------------------------------------------
" COC
" ---------------------------------------------
" extensions
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-jest',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-html',
      \ 'coc-yaml',
      \ 'coc-eslint',
      \ 'coc-prettier', 
      \ 'coc-json',
      \ 'coc-stylelintplus',
      \ 'coc-pairs',
      \ 'coc-snippets',
      \ 'coc-prisma',
      \ 'coc-styled-components',
      \ 'coc-elixir',
      \ 'coc-inline-jest',
      \ 'coc-solargraph',
      \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Make <tab> used for trigger completion, completion confirm,
" snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

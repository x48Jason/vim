call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'

Plug 'skywind3000/vim-preview'
Plug 'skywind3000/vim-terminal-help'

Plug 'itchyny/lightline.vim'
Plug 'lfv89/vim-interestingwords'

Plug 'x48Jason/kernel-cscope.vim'
Plug 'x48Jason/autotab.vim'

call plug#end()

let g:lightline = {
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive'
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' }
	\ }
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

let g:terminal_height = 20
let g:cscope_quickfix_height_max = 20
let g:cscope_quickfix_height_min = 10

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set laststatus=2
set hlsearch
nnoremap <leader>s :let @/ = ""<cr>
set number
set relativenumber
"set cscopetag
set csto=0
set nowrap

set tags=tags;,tags

nnoremap <silent> <TAB> :SwitchNextWindow<cr>

nnoremap <silent> q :TogglePreviewWindow<cr>
autocmd FileType qf setlocal norelativenumber

hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
autocmd FileType qf setlocal cursorline

noremap <m-UP> :PreviewScrollOneLine -1<cr>
noremap <m-DOWN> :PreviewScrollOneLine +1<cr>

nnoremap <F4> :CscopeFind 
nnoremap <leader>s :CscopeFind s
nnoremap <leader>g :CscopeFind g
nnoremap <leader>f :CscopeFind f
nnoremap <leader>q :cclose<cr>

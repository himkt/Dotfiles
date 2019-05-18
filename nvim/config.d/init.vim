" vim: ft=vim
"
" ---------------------
"
" NeoVim configuration
"
" @author = 'himkt'
"
" ---------------------
"

"" load basic vim configuration
source $HOME/.dotfiles/vim/config.d/vimrc

"" If you have an error, `cd $HOME/.dotfiles && make requirements` may solve it.
let g:python3_host_prog = $PYENV_ROOT . '/shims/python'

" load packages
source $HOME/.dotfiles/nvim/config.d/tiny.init.vim

" use custom colorscheme
syntax      reset
colorscheme iceberg

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call deoplete#custom#source('_',  'max_menu_width', 0)
let g:deoplete#enable_at_startup = 1

" Plug 'autozimu/LanguageClient-neovim'
set completefunc=LanguageClient#complete
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'python': ['pyls']}
nnoremap <silent> H  :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K  :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Plug 'Shougo/neosnippet'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/.dotfiles/snippet'

" Plug 'scrooloose/nerdtree'
nnoremap <silent><C-e> : NERDTreeToggle<CR>

" Plug 'godlygeek/tabular'
vnoremap tr : <C-u>Tabularize<Space>/

" Plug 'majutsushi/tagbar'
nnoremap <silent><C-t> : TagbarToggle<CR>

" Plug 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
set statusline=%anzu#search_status()

" Plug 'scrooloose/syntastic'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -I' . $BREW_HOME . '/include'
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_rust_checkers = ['rustc', 'cargo']

" Plug 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)

" Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']

" Plug 'lervag/vimtex'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
autocmd FileType tex setlocal omnifunc=vimtex#complete#omnifunc
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})

" Plug 'tell-k/vim-autopep8'
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
  call Preserve(':silent %!autopep8 -')
endfunction
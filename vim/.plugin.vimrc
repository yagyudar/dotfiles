" vim:set ts=8 sts=2 sw=2 tw=0:

""""""""""""""""""""""""""""""
" markdown
let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""
" previm
" let g:previm_enable_realtime = 0
let g:previm_show_header = 0
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.uiki set filetype=markdown
  " autocmd BufNewFile,BufRead *.uiki set filetype=uiki.markdown
augroup END

""""""""""""""""""""""""""""""
" ale
let g:ale_linters = {
\   'java': ['checkstyle'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'css': ['stylelint'],
\}
let g:ale_java_checkstyle_config = '$HOME/work/common/sun_checks.xml'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_maximum_file_size = 500000
" let g:ale_sign_column_always = 1
set signcolumn=yes

""""""""""""""""""""""""""""""
" ZenSpace
augroup vimrc-zenspace
  autocmd!
  autocmd ColorScheme * highlight ZenSpace cterm=undercurl ctermbg=NONE ctermfg=60 gui=undercurl guibg=NONE guifg=#5F5F87
augroup END

""""""""""""""""""""""""""""""
" quickhl
let g:quickhl_manual_enable_at_startup = 1
noremap [quickhl] <Nop>
map ,q [quickhl]
nmap [quickhl]* <Plug>(quickhl-manual-this)
xmap [quickhl]* <Plug>(quickhl-manual-this)
nmap [quickhl]# <Plug>(quickhl-manual-this)
xmap [quickhl]# <Plug>(quickhl-manual-this)

""""""""""""""""""""""""""""""
" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 5
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'showtime']
augroup vimrc-indent-guides
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 guifg=#303030 ctermbg=235 ctermfg=236
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1C1C1C guifg=#303030 ctermbg=234 ctermfg=236
augroup END

""""""""""""""""""""""""""""""
" sandwitch
nnoremap s <Nop>
nnoremap sa <Nop>
nmap s <Plug>(operator-sandwich-add)
nmap sa <Plug>(operator-sandwich-add)a
xmap s <Plug>(operator-sandwich-add)
xmap sa <Plug>(operator-sandwich-add)a

""""""""""""""""""""""""""""""
" submode
let g:submode_keep_leaving_key = 1

""""""""""""""""""""""""""""""
" vim-easy-align
nmap ,a <Plug>(EasyAlign)
xmap ,a <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
" vim-asterisk
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
let g:asterisk#keeppos = 1

""""""""""""""""""""""""""""""
" ctrlp
nnoremap [ctrlp] <Nop>
nmap ,p [ctrlp]
" uiki
nnoremap [ctrlp]p :<C-u>CtrlP<CR>
nnoremap [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap [ctrlp]d :<C-u>CtrlPDir<CR>
" nnoremap [ctrlp]l :<C-u>CtrlPLine %<CR>
nnoremap [ctrlp]l :<C-u>CtrlPLine<CR>
nnoremap [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [ctrlp]x :<C-u>CtrlPMixed<CR>
nnoremap [ctrlp]y :<C-u>CtrlPYankRound<CR>
let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_tilde_homedir=1
let g:ctrlp_max_files = 20000
" let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<Esc>', '<C-c>', '<C-g>', '<C-@>'] }

""""""""""""""""""""""""""""""
" vaffle
let g:vaffle_show_hidden_files = 1

""""""""""""""""""""""""""""""
" context_filetype
let g:context_filetype#search_offset = 500

""""""""""""""""""""""""""""""
" yankround
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" postconfig
""""""""""""""""""""""""""""""
colorscheme iceberg

""""""""""""""""""""""""""""""
" submode
" タブ移動
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', '<tab>', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
call submode#map('changetab', 'n', '', '<S-tab>', 'gT')
" ウィンドウサイズ変更
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

""""""""""""""""""""""""""""""
" superleader
map <Space> [superleader]
map [superleader] [ctrlp]
map [superleader]<Space> [ctrlp]b
nmap [superleader]b [ctrlp]b
nmap [superleader]c [ctrlp]x
nmap [superleader]m [ctrlp]m
nmap [superleader]s [terminal]s
nmap [superleader]t [terminal]t
nmap [superleader]: q:
nmap [superleader]w <C-w>
nmap [superleader]* [quickhl]*
xmap [superleader]* [quickhl]*
nmap [superleader]# [quickhl]#
xmap [superleader]# [quickhl]#

""""""""""""""""""""""""""""""
" " previm
" function! s:depends()
"   return ['github.com/tyru/open-browser.vim']
" endfunction

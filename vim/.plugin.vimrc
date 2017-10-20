" vim:set ts=8 sts=2 sw=2 tw=0:

" vimproc------------------------------
let g:vimproc#download_windows_dll = 1

" markdown ------------------------------
let g:vim_markdown_folding_disabled=1

" quickhl ------------------------------
let g:quickhl_manual_enable_at_startup = 1

noremap [quickhl] <Nop>
map ,q [quickhl]
nmap [quickhl]* <Plug>(quickhl-manual-this)
xmap [quickhl]* <Plug>(quickhl-manual-this)
nmap [quickhl]# <Plug>(quickhl-manual-this)
xmap [quickhl]# <Plug>(quickhl-manual-this)

" terminal ------------------------------
let g:quickhl_manual_enable_at_startup = 1

noremap [terminal] <Nop>
map ,t [terminal]
nnoremap <silent> [terminal]c : <C-u>terminal ++curwin ++close<CR>
nnoremap <silent> [terminal]t : <C-u>terminal ++curwin ++close<CR>
nnoremap <silent> [terminal]b : <C-u>terminal ++curwin ++close bash<CR>
nnoremap <silent> [terminal]s : <C-u>terminal ++curwin ++close bash<CR>

" previm ------------------------------
let g:previm_enable_realtime = 0
let g:previm_show_header = 0
" let g:previm_custom_css_path = '~/Desktop/mine.css'
augroup PrevimSettings
  autocmd!
  autocmd FileType uiki set filetype=markdown | set filetype=uiki.markdown
augroup END

" sandwich ------------------------------
nnoremap s <Nop>
nnoremap sa <Nop>
nmap s <Plug>(operator-sandwich-add)
nmap sa <Plug>(operator-sandwich-add)a
xmap s <Plug>(operator-sandwich-add)
xmap sa <Plug>(operator-sandwich-add)a

" asterisk ------------------------------
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
let g:asterisk#keeppos = 1

" incsearch ------------------------------
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-fuzzy-/)
map g? <Plug>(incsearch-fuzzy-?)

" ctrlp ------------------------------
nnoremap [ctrlp] <Nop>
nmap ,p [ctrlp]

" uiki
nnoremap <expr>[ctrlp]i ':<C-u>CtrlP '. g:unite_uiki_path . '<CR>'
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

" zenspace(trial) ----------------------------------------
augroup vimrc-zenspace
  autocmd!
  autocmd ColorScheme * highlight ZenSpace cterm=undercurl ctermbg=NONE ctermfg=60 gui=undercurl guibg=NONE guifg=#5F5F87
augroup END

" memolist(trial) ----------------------------------------
let g:memolist_memo_suffix = "uiki"
" let g:memolist_memo_date = "%Y-%m-%d %H:%M"
" let g:memolist_prompt_tags = 1
" let g:memolist_prompt_categories = 1
" let g:memolist_qfixgrep = 1
" let g:memolist_vimfiler = 1
" let g:memolist_template_dir_path = "path/to/dir"
"
nnoremap [memolist] <Nop>
nmap ,m [memolist]
nnoremap <silent> [memolist]n :<C-u>MemoNew<CR>
nnoremap <silent> [memolist]m :<C-u>CtrlPMemoList<CR>

" "dirvish(trial) ----------------------------------------
" let g:dirvish_relative_paths = 1
" augroup MyDirvishSetting
"   autocmd!
"   autocmd FileType dirvish
"     \  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
"     \ |xnoremap <buffer> T :call dirvish#open('tabedit', 0)<CR>
"   autocmd FileType dirvish nnoremap <buffer> ~ :<C-U>Dirvish ~/<CR>
"   autocmd FileType dirvish nmap <buffer> l <CR>
"   autocmd FileType dirvish nmap <buffer> h <Plug>(dirvish_up)
" 
"   " Sort folders at the top.
"   autocmd FileType dirvish sort r /[^\/]$/
" 
" augroup END

" indent-guides ----------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 5

let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'showtime']
augroup vimrc-indent-guides
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 guifg=#303030 ctermbg=235 ctermfg=236
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1C1C1C guifg=#303030 ctermbg=234 ctermfg=236
augroup END

" hopping ----------------------------------------
nmap <Space>/ <Plug>(hopping-start)
let g:hopping#keymapping = {
\   "\<C-n>" : "<Over>(hopping-next)",
\   "\<C-j>" : "<Over>(hopping-next)",
\   "\<C-p>" : "<Over>(hopping-prev)",
\   "\<C-k>" : "<Over>(hopping-prev)",
\   "\<C-u>" : "<Over>(scroll-u)",
\   "\<C-d>" : "<Over>(scroll-d)",
\   "\<C-y>" : "<Over>(scroll-y)",
\   "\<C-e>" : "<Over>(scroll-e)",
\}

" ale ----------------------------------------
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\}
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
" let g:ale_sign_column_always = 1
set signcolumn=yes


" context-filetype ------------------------------
let g:context_filetype#filetypes = {
\ 'vue' : [
\   {
\     'start' : '<script>',
\     'end' : '</script>',
\     'filetype' : 'javascript',
\   },
\   {
\     'start' : '<script\s*lang.*ts.*',
\     'end' : '</script>',
\     'filetype' : 'typescript',
\   },
\   {
\     'start' : '<style>',
\     'end' : '</style>',
\     'filetype' : 'css',
\   },
\   {
\     'start' : '<style\slang*.*sass.*',
\     'end' : '</style>',
\     'filetype' : 'sass',
\   },
\   {
\     'start' : '<style\s*lang.*stylus.*',
\     'end' : '</style>',
\     'filetype' : 'stylus',
\   },
\   {
\     'start' : '<template>',
\     'end' : '</template>',
\     'filetype' : 'html',
\   },
\   {
\     'start' : '<template\slang*.*pug.*',
\     'end' : '</template>',
\     'filetype' : 'pug',
\   },
\ ]
\}

" yankround ----------------------------------------
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" superleader ----------------------------------------
" スペースを便利なリーダーとして使う。
map <Space> [superleader]
map [superleader] [ctrlp]
map [superleader]<Space> [ctrlp]b
nmap [superleader]c [ctrlp]x
nmap [superleader]n [memolist]
" trial
nmap [superleader]o :<C-u>/ oldfiles<Home>browse filter /
nmap [superleader]s [terminal]s
nmap [superleader]t [terminal]t
" /trial
nmap [superleader]: q:
nmap [superleader]w <C-w>
nmap [superleader]* [quickhl]*
xmap [superleader]* [quickhl]*
nmap [superleader]# [quickhl]#
xmap [superleader]# [quickhl]#
nmap [superleader]<tab> <C-w><Space>

"submode ----------------------------------------
" submode.vim {{{
let g:submode_keep_leaving_key = 1

" タブ移動
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', '<tab>', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
call submode#map('changetab', 'n', '', '<S-tab>', 'gT')
" バッファ移動
call submode#enter_with('changebuf', 'n', '', 'gb', ':<C-u>bn<CR>')
call submode#enter_with('changebuf', 'n', '', 'gB', ':<C-u>bp<CR>')
call submode#map('changebuf', 'n', '', 'b', ':<C-u>bn<CR>')
call submode#map('changebuf', 'n', '', 'B', ':<C-u>bp<CR>')
" ウィンドウサイズ変更
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
call submode#enter_with('zoom', 'n', 'r', '[zoom]')
call submode#map('zoom', 'n', 'r', '+', '<Plug>(my_zoom_in)')
call submode#map('zoom', 'n', 'r', '-', '<Plug>(my_zoom_out)')

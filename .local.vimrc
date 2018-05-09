" vim:set ts=8 sts=2 sw=2 tw=0:

set t_Co=256
colorscheme iceberg

set shellpipe=>

let g:memolist_path = '/Volumes/yagyudar/.uiki'

function! s:MemoNewProgress(str)
  if !exists('g:memolist_filename_prefix_none')
    let g:memolist_filename_prefix_none=0
  endif
  let l:temp_memolist_filename_prefix_none=g:memolist_filename_prefix_none
  let g:memolist_filename_prefix_none=1

  if strlen(a:str) > 0
    let l:key=a:str
  else
    let l:key=strftime("%Y%m%d")
  endif

  let l:title = 'progress-' . l:key . '-' . 'lafa'
  call memolist#new(l:title)

  let g:memolist_filename_prefix_none=l:temp_memolist_filename_prefix_none
  unlet l:temp_memolist_filename_prefix_none
endfunction

command! -nargs=? MemoNewProgress call <SID>MemoNewProgress('<args>')
nnoremap [memolist]p :<C-u>MemoNewProgress

set expandtab

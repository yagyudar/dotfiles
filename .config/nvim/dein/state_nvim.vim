if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/yagyudar/.config/nvim,/etc/xdg/nvim,/Users/yagyudar/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/yagyudar/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/yagyudar/.config/nvim/after,/Users/yagyudar/.config/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/yagyudar/.config/nvim/init.vim', '/Users/yagyudar/.config/nvim/dein-plugins.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/yagyudar/.config/nvim/dein'
let g:dein#_runtime_path = '/Users/yagyudar/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/yagyudar/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/Users/yagyudar/.config/nvim,/etc/xdg/nvim,/Users/yagyudar/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/yagyudar/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/yagyudar/.config/nvim/dein/repos/github.com/autozimu/LanguageClient-neovim,/Users/yagyudar/.config/nvim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime,/Users/yagyudar/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/yagyudar/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/yagyudar/.config/nvim/after'
filetype off

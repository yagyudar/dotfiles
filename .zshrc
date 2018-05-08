
fpath=(~/tools/cd-bookmark(N-/) $fpath)
autoload -Uz cd-bookmark
alias cf='cd-bookmark'

# 補完機能を有効にする
autoload -Uz compinit
compinit -C
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

DIRSTACKSIZE=100
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# Shift-Tabで補完候補を逆順("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# コマンド訂正
#setopt correct

# emacs 風キーバインドにする
bindkey -e
 
# その他とりあえずいるもの
export LANG=ja_JP.UTF-8
 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# フローコントロールを無効にする
setopt no_flow_control
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# vim:set ft=zsh :

# promptの設定
setopt prompt_subst
RPROMPT="%F{cyan}%*"

##################################################
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors; colors

zstyle ':vcs_info:*' formats ' %b'
zstyle ':vcs_info:*' actionformats ' %b<%a>'
zstyle ':vcs_info:svn:*' branchformat 'r%r'

# hooks 設定
zstyle ':vcs_info:git+set-message:*' hooks git-hook-begin git-color
zstyle ':vcs_info:svn+set-message:*' hooks svn-color

# git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
function +vi-git-hook-begin() {
    if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        # 0以外を返すとそれ以降のフック関数は呼び出されない
        return 1
    fi
    return 0
}

function +vi-git-color() {
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
            color=${fg[green]}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
            color=${fg[yellow]}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
            color=${fg_bold[red]}
    else
            color=${fg[red]}
    fi
    hook_com[branch]="%{$color%}$hook_com[branch]%{$reset_color%}"
}

function +vi-svn-color() {
    color=${fg[blue]}
    hook_com[branch]="%{$color%}$hook_com[branch]%{$reset_color%}"
	# 重い
    #st=`svn st 2> /dev/null`
    #if [[ -n `echo "$st" | grep "^M"` ]]; then
    #        color=${fg_bold[red]}
    #elif [[ -n `echo "$st" | grep "^?"` ]]; then
    #        color=${fg[yellow]}
    #else
    #        color=${fg[blue]}
    #fi
    #hook_com[branch]="%{$color%}$hook_com[branch]%{$reset_color%}"
}

# function _update_vcs_info_msg() {
#     psvar=()
#     LANG=en_US.UTF-8 vcs_info
#     [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# 	PROMPT='[%n@%m %F{cyan}%c%f${psvar}]%(!.#.$) '
# }

function _prompt_init() {
    PROMPT=''
}
function _prompt_begin() {
    PROMPT="${PROMPT}["
}
function _prompt_base() {
    PROMPT="${PROMPT}%n@%m "
}
function _prompt_vcs_info() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    PROMPT="${PROMPT}%F{cyan}%c%f${psvar} "
}
function _prompt_vimruntime() {
    # refs: http://qiita.com/dayflower/items/06cba1bc3d8bf5403659
    [[ -n "$VIMRUNTIME" ]] && \
        PROMPT="${PROMPT}%{${fg[green]}%}Vim%{${reset_color}%} "
}
function _prompt_end() {
    PROMPT="${PROMPT}]%(!.#.$) "
}
function _setup_prompt() {
    _prompt_init
    _prompt_vimruntime
    _prompt_begin
    _prompt_base
    _prompt_vcs_info
    _prompt_end
}

# add-zsh-hook precmd _update_vcs_info_msg
add-zsh-hook precmd _setup_prompt
##################################################

# 実行中のコマンドまたはカレントディレクトリの表示
if [ $TERM = screen-bce -o $TERM = screen ];then
preexec() {
    echo -ne "\ek#${1%% *}\e\\"
}
precmd() {
    echo -ne "\ek$(basename $(pwd))\e\\"
}
fi

# ローカルのzshrcが存在すれば読み込む
# 参考: http://qiita.com/awakia/items/1d5cd440ce58ef4fb8ae
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

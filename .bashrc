# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


if [ -f "${HOME}/.bashrc.local" ] ; then
  source "${HOME}/.bashrc.local"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

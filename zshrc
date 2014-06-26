# load our own functions
fpath=(~/.zsh/completions $fpath)
fpath=(~/.zsh/functions $fpath)

# completion
autoload -U compinit && compinit

# prompt
autoload -U promptinit && promptinit
prompt pure

# history settings
setopt histignoredups
SAVEHIST=4096
HISTSIZE=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Try to correct command line spelling
setopt correct correctall

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey '^[[5D' emacs-backward-word
bindkey '^[[5C' emacs-forward-word

# use emacs as the visual editor
export VISUAL="emacs -nw"
export EDITOR=$VISUAL

# term
export TERM=xterm-256color

# browser
export BROWSER=chromium-browser

# dir colors
[[ -f ~/.dircolors ]] && eval `dircolors ~/.dircolors`

# gnome conf
# zenburn theme
gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/background_color "#3F3F3F"
gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/foreground_color "#DCDCDC"
gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/bold_color "#EFEFEF"
gconftool-2 --set --type string /apps/gnome-terminal/profiles/Default/palette "#3F3F3F:#FF0000:#EFEFEF:#E3CEAB:#DFAF8F:#CC9393:#7F9F7F:#DCDCCC:#3F3F3F:#FFCFCF:#EFEFEF:#E3CEAB:#DFAF8F:#CC9393:#7F9F7F:#DCDCCC"

# solarized theme
# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002B2B3636"
# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#65657B7B8383"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# load usr local binaries
export PATH="/usr/local/bin:$PATH"

# load rbenv if available
export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

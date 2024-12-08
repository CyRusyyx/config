# Path to your oh-my-zsh installation.
 export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme, see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME=random
 ZSH_THEME=robbyrussell

# Set theme random list
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Set plugins
plugins=(
	git docker kubectl 
	systemd tmux aliases 
	colored-man-pages colorize themes
	zsh-autosuggestions
	autojump
	zsh-history-substring-search
	you-should-use
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# ================== #
# User Configuration

# set autojump
. /usr/share/autojump/autojump.sh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Bind key
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Set golang proxy 
export GOPROXY=https://goproxy.cn,http://goproxy.xiaoe-tools.com,direct,GO111MODULE=on,GONOSUMDB=talkcheap.xiaoeknow.com

# Set v2ray proxy
#  export ALL_PROXY="socks5://127.0.0.1:10808"
#  export http_proxy="http://127.0.0.1:10809"
#  export https_proxy="http://127.0.0.1:10809"
#  export NO_PROXY=127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16

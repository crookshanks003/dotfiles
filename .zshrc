export ZSH="/home/crookshanks/.oh-my-zsh"

ZSH_THEME="awesomepanda"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#928374'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

#local bin
export PATH="/home/crookshanks/.local/bin/:$PATH"

#Java and android
export NVM_DIR="$HOME/.nvm"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"

export ANDROID_SDK_ROOT=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

#node and nvm
export NODE_PATH=/usr/lib/node_modules
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$(yarn global bin):$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"


#conf command for quick config
conf(){
	CURRENT=$(pwd)
	case $1 in
		"zsh")
			nvim ~/.zshrc
			;;
		"nvim")
			cd ~/.config/nvim && nvim init.lua;;
		"vim")
			cd ~/.config/nvim && nvim init.lua;;
		"i3")
			cd ~/.config/i3 && nvim config;;
		"alac")
			cd ~/.config/alacritty && nvim alacritty.yml;;
		"tmux")
			nvim ~/.config/tmux/tmux.conf;;
		"kitty")
			nvim ~/.config/kitty;;
	esac
	cd $CURRENT
}

alias vim="nvim"
alias ohmyzsh="mate ~/.oh-my-zsh"

#lcale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export BAT_THEME="ansi-dark"

#Go
export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOPATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


alias luamake=/home/pritesh/.local/share/nvim/language-servers/lua-language-server/3rd/luamake/luamake

#tmux
alias ta="tmux a"
alias td="tmux detach-client"
alias tk="tmux kill-session" 
alias tks="tmux kill-server"
bindkey -s ^f "tmux-sessionizer\n"
alias glis="tmux-sessionizer ~/proj/drife/glis-go/"
alias api="tmux-sessionizer ~/proj/drife/api.drife.io/"

# gpg stuff
GPG_TTY=$(tty)
export GPG_TTY
export GCM_CREDENTIAL_STORE="gpg"

#google-cloud-sdk
if [ -f '/home/pritesh/packages/google-cloud-sdk-365.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc' ]; then . '/home/pritesh/packages/google-cloud-sdk-365.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/pritesh/packages/google-cloud-sdk-365.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/pritesh/packages/google-cloud-sdk-365.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc'; fi

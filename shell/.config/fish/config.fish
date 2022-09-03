abbr -a e nvim
abbr -a gs 'git status'

setenv DOTFILES $HOME/configs

# Type d to move to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

function conf
    cd $DOTFILES
end

function cdf
    cd $HOME
    cd (fd --type directory --follow | fzf)
end

function tree --argument level
    set -q level[1]
    or set level 3
    exa --tree --all --git-ignore --level=$level
end

function dstart
    sudo systemctl start docker.service
    sudo systemctl start containerd.service
end

function dstop
    sudo systemctl stop docker.service
    sudo systemctl stop containerd.service
end

function mydocker
    docker build -t mydocker . && docker run --cap-add="SYS_ADMIN" mydocker $argv
end

function reload_shell
    source ~/.config/fish/config.fish
end

if functions -q fzf_key_bindings
    fzf_key_bindings
end

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude ".git"'
setenv FZF_CTRL_T_COMMAND 'fd --type directory --follow --hidden --exclude ".git"'
setenv FZF_DEFAULT_OPTS '--height 40%'

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline
setenv EDITOR nvim

nightfox_fish

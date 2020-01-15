#
# ~/.bashrc
#

h(){
    echo """Basic usage help
    g [URL]             gallery-dl; download URL
    gin [FILE]          load list from FILE and feed it to g
    mon                 monitor change in specific site
    mpvnv               mpv no video; music player
    py                  python
    skill               ( ͡° ͜ʖ ͡°)
    torbrowser          Tor Browser
    torchromium         tor proxy in chromium
    ZZ                  exit
    """
}

# enable control-s and control-q in vim
stty -ixon

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt ori PS1='[\u@\h \W]\$ '
PS1='\[\033[01;36m\][\u@\h \W]\[\033[00m\]\$ '

alias asource='source $HOME/.bashrc' 
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dan='termite -e $HOME/Python/dan_client.py & $HOME/Python/dan_server.py'
alias g=$HOME/Bash/gallery_dl.sh
alias j="cd /media/c/Adisc/H; VIMENV=j nvim Home.md"
alias linkfinder=$HOME/Git/LinkFinder/linkfinder.py
alias ls='ls --color=auto'
alias m=$HOME/Git/ss/manual.py
alias mon=$HOME/Bash/core/monitor.sh
alias mpvnv="mpv --no-video --volume=50 --profile=pseudo-gui --keep-open &"
alias py=python
alias server="python -m http.server 8000 --bind 127.0.0.1 \
    --directory '/media/c/Load/dan/data'"
alias skill='pkill mcomix > /dev/null && echo "Done!" || echo "Problemo!"'
alias sublist3r=$HOME/Git/Sublist3r/sublist3r.py
alias torchromium='chromium --proxy-server="socks5://127.0.0.1:9150" \
    --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" &'
#alias vimprev=$HOME/Bash/vimprev
alias vimprev="VIMENV=prev vim $@"
alias ZZ=exit

keymap(){
    setxkbmap \
        -option \
        -option caps:none \
        -option ctrl:nocaps

    xmodmap \
        -e 'keycode 66 = Escape' \
        -e 'keycode 9 = NoSymbol' \
        -e 'keycode 64 = Hyper_L Meta_L Alt_L Meta_L' \
        -e 'keycode 133 = Mode_switch Super_L Mode_switch Super_L' \
        -e 'keycode 43 = h H Left NoSymbol Left NoSymbol Left' \
        -e 'keycode 44 = j J Down NoSymbol Down NoSymbol Down' \
        -e 'keycode 45 = k K Up NoSymbol Up NoSymbol Up' \
        -e 'keycode 46 = l L Right NoSymbol Right NoSymbol Right' \
        -e 'keycode 0x69 = Caps_Lock'
}

#todo: put this in bash script
prox(){
    case $1 in
    1)
        echo "[prox][msg] Running via proid on 192.168.43.1:9880"
        proxy=http://192.168.43.1:9880/
        ;;
    *)
        echo "[prox][msg] Tor proxy 127.0.0.1:9150"
        proxy=socks5h://127.0.0.1:9150/
        ;;
    esac
    export \
        http_proxy="$proxy" \
        https_proxy=$proxy \
        ftp_proxy=$proxy \
        rsync_proxy=$proxy \
        HTTP_PROXY=$proxy \
        HTTPS_PROXY=$proxy \
        FTP_PROXY=$proxy \
        RSYNC_PROXY=$proxy
}

torbrowser(){
    if sudo true; then
        sudo -g oknet /media/c/Adisc/tor-browser_en-US/Browser/start-tor-browser &
    fi
}

#export GOPATH=$HOME/Go

if [[ $PATH != */Scripts/* ]]; then
    export PATH="$PATH:$HOME/Scripts/bin"
    export PATH="$PATH:$HOME/Go/bin"
    #source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash
    source $HOME/Go/src/github.com/tomnomnom/gf/gf-completion.bash
fi

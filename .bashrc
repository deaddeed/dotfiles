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
alias config='/usr/bin/git --git-dir=/home/c/.dotfiles/ --work-tree=/home/c'
alias ls='ls --color=auto'
alias m=/home/c/Git/ss/manual.py
alias mon=/home/c/Bash/core/monitor.sh
alias mpvnv="mpv --no-video --volume=50 --profile=pseudo-gui --keep-open &"
alias py=python
alias server="python -m http.server 8000 --bind 127.0.0.1 \
    --directory '/media/c/Load/dan/data'"
alias skill='pkill YACReader > /dev/null && echo "Done!" || echo "Problemo!"'
alias torchromium='chromium --proxy-server="socks5://127.0.0.1:9150" \
    --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" &'
#alias vimprev=/home/c/Bash/vimprev
alias vimprev="VIMENV=prev vim $@"
alias ZZ=exit

#todo: put this in bash script
prox(){
    case $1 in
    1)
        echo "[prox][msg] Running via proid on 192.168.43.1:9880"
        proxy=http://192.168.43.1:9880/
        ;;
    *)
        echo "[prox][msg] Tor proxy 127.0.0.1:9150"
        proxy=http://127.0.0.1:9150/
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

g(){
    if sudo true; then
        sudo -g oknet /home/c/Bash/gallery_dl.sh $1
    fi
}
gin(){
    for line in $(cat $1)
    do
        printf "%s\n" $line > $HOME/.config/gallery-dl/.stdinpipe &
    done
    if ! pgrep -f gallery_dl.sh > /dev/null; then
        if sudo true; then
            sudo -g oknet /home/c/Bash/gallery_dl.sh
        fi
    else
        echo "[bashrc][gin][msg] gallery_dl.sh already running"
    fi
}

#export GOPATH=$HOME/Go

if [[ $PATH != *"Bash"* ]]; then
    export PATH="$PATH:$HOME/Bash/bin"
    export PATH="$PATH:$HOME/Python/bin"
    export PATH="$PATH:$HOME/Go/bin"
    #source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash
    source /home/c/Go/src/github.com/tomnomnom/gf/gf-completion.bash
fi

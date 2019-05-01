reset-yubi () {
    killall ssh-agent gpg-agent > /dev/null 2>&1
    yubi
}

autoload -Uz reset-yubi

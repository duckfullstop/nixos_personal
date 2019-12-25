yubi () {
  # Per advice here https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
  # and
  # https://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
  gpg-connect-agent --quiet /bye
  SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  export SSH_AUTH_SOCK
}

autoload -Uz yubi

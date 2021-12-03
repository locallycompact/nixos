set -x HOSTNAME (hostname)
switch $HOSTNAME
  case "aiur"
    eval (ssh-agent -c)
    ssh-add /home/lc/.ssh/id_rsa
end


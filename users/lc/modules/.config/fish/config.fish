if status is-interactive
   eval (ssh-agent -c)
   ssh-add
end

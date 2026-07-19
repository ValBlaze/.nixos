if status is-interactive
  set fish_greeting

  function fish_user_key_bindings
    fish_vi_key_bindings
      bind -M insert ctrl-backspace backward-kill-path-component
  end
end

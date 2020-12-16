function fish_title -a last_command
    echo $_fly_pwdinfo $_fly_symbol_prompt (
      string replace --all -- \n "; " $last_command
    )
end

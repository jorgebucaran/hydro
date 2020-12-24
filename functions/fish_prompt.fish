function fish_prompt
    set --local last_status $pipestatus
    set --local color_pwd (set_color $hydro_color_pwd)
    set --local color_git (set_color $hydro_color_git)
    set --local color_error (set_color $hydro_color_error)
    set --local color_prompt (set_color $hydro_color_prompt)

    test (math +$last_status) = 0 \
        && set --local prompt "$color_prompt$hydro_symbol_prompt" \
        || set --local prompt "$color_error"[(string join "\x1b[2m|\x1b[22m" $last_status)]

    string unescape "$color_pwd$_hydro_pwd_info $color_git$$_hydro_git_info$_hydro_cmd_duration$prompt\x1b[0m "
end

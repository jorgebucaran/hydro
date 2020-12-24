function fish_prompt
    set --local last_status $pipestatus
    set --local color_pwd (set_color $hydro_color_pwd)
    set --local color_base (set_color $hydro_color_base)
    set --local color_error (set_color $hydro_color_error)

    test (math +$last_status) = 0 \
        && set --local prompt "\x1b[2m$hydro_symbol_prompt\x1b[22m" \
        || set --local prompt "$color_error"[(string join "\x1b[2m|\x1b[22m" $last_status)]

    string unescape "$color_pwd$_hydro_pwd_info $color_base$$_hydro_git_info$_hydro_cmd_duration$prompt\x1b[0m "
end

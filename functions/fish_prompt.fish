function fish_prompt -d Hydro
    set --local last_status $pipestatus
    set --local _hydro_color_pwd (set_color $hydro_color_pwd)
    set --local _hydro_color_git (set_color $hydro_color_git)
    set --local _hydro_color_error (set_color $hydro_color_error)
    set --local _hydro_color_prompt (set_color $hydro_color_prompt)
    set --local _hydro_color_duration (set_color $hydro_color_duration)

    test (math +$last_status) = 0 \
        && set --local prompt "$_hydro_color_prompt$hydro_symbol_prompt" \
        || set --local prompt "$_hydro_color_error"[(string join "\x1b[2m|\x1b[22m" $last_status)]

    echo -en "$_hydro_color_pwd$_hydro_pwd_info\x1b[0m $_hydro_color_git$$_hydro_git_info\x1b[0m$_hydro_color_duration$_hydro_cmd_duration\x1b[0m$prompt\x1b[0m "
end

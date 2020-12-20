function fish_prompt
    set --local last_status $pipestatus
    test (math +$last_status) = 0 \
        && set --local prompt "\x1b[2m$_hydro_symbol_prompt\x1b[22m" \
        || set --local prompt "$_hydro_color_error"[(string join "\x1b[2m|\x1b[22m" $last_status)]

    string unescape "$_hydro_color_pwd$_hydro_pwd_info $_hydro_color_base$$_hydro_git_info$_hydro_cmd_duration$prompt\x1b[0m "
end

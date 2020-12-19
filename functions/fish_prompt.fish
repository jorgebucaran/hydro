function fish_prompt
    set --local last_status $pipestatus
    test (math +$last_status) = 0 \
        && set --local prompt "\x1b[2m$_fly_symbol_prompt\x1b[22m" \
        || set --local prompt "$_fly_color_error"[(string join "\x1b[2m|\x1b[22m" $last_status)]

    string unescape "$_fly_color_pwd$_fly_pwd_info $_fly_color_base$$_fly_git_info$_fly_cmd_duration$prompt\x1b[0m "
end

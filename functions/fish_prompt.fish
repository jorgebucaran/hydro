function fish_prompt
    set --local last_status $pipestatus
    test (math +$last_status) = 0 \
        && set --local prompt $_fly_color_dim$_fly_symbol_prompt \
        || set --local prompt "$_fly_color_error"[(
            string join "$_fly_color_dim|$_fly_color_reset$_fly_color_error" $last_status
        )]"$_fly_color_reset"

    echo -n "$_fly_color_base$_fly_pwd_info $$_fly_git_info$prompt$_fly_color_reset "
end

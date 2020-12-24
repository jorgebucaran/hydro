function fish_mode_prompt
    if test $fish_key_bindings != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol
        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color $fish_color_selection)
                set vi_mode_symbol N
            case insert
                set vi_mode_color (set_color $fish_color_selection)
                set vi_mode_symbol I
            case replace_one
                set vi_mode_color (set_color --reverse $fish_color_selection)
                set vi_mode_symbol R
            case visual
                set vi_mode_color (set_color --reverse $fish_color_selection)
                set vi_mode_symbol V
        end
        echo -n "$vi_mode_color $vi_mode_symbol $_hydro_color_reset "
    end
end
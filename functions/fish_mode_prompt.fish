function fish_mode_prompt
    if test "$fish_key_bindings" != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol
        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color $hydro_color_vi_mode_default)
                set vi_mode_symbol N
            case insert
                set vi_mode_color (set_color $hydro_color_vi_mode_insert)
                set vi_mode_symbol I
            case replace replace_one
                set vi_mode_color (set_color $hydro_color_vi_mode_replace)
                set vi_mode_symbol R
            case visual
                set vi_mode_color (set_color $hydro_color_vi_mode_visual)
                set vi_mode_symbol V
        end
        echo -e "$vi_mode_color$vi_mode_symbol$(set_color normal) "
    end
end

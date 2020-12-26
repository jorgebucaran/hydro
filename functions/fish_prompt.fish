function fish_prompt -d Hydro
    set --local last_status $pipestatus
    set --local prompt "$_hydro_color_prompt$hydro_symbol_prompt"

    for code in $last_status
        if test $code -ne 0
            set prompt "$_hydro_color_error"[(string join "\x1b[2mǀ\x1b[22m" $last_status)]
            break
        end
    end

    echo -en "$_hydro_color_pwd$_hydro_pwd_info\x1b[0m $_hydro_color_git$$_hydro_git_info\x1b[0m$_hydro_color_duration$_hydro_cmd_duration\x1b[0m$prompt\x1b[0m "
end

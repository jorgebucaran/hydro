function fish_prompt --description Hydro
    if contains -- --final-rendering $argv
        set -l prefix
        switch $hydro_transient
            case basename
                set prefix "$_hydro_color_pwd"(string replace --regex --all -- '.*/' '' $PWD)"$hydro_color_normal "
            case pwd
                set prefix "$_hydro_color_pwd$_hydro_pwd$hydro_color_normal "
        end
        echo -e -n "$prefix$_hydro_color_prompt$hydro_symbol_prompt$hydro_color_normal "
        return
    end
    echo -e -n "$_hydro_color_start$hydro_symbol_start$hydro_color_normal$_hydro_color_pwd$_hydro_pwd$hydro_color_normal $_hydro_color_git$$_hydro_git$hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$_hydro_status$hydro_color_normal "
end

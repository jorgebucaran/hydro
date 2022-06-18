function fish_prompt --description Hydro
    echo -e "$hydro_pre_prompt$_hydro_color_pwd$_hydro_pwd$hydro_color_normal $_hydro_color_git$$_hydro_git$hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$_hydro_prompt$hydro_color_normal$hydro_post_prompt"
end

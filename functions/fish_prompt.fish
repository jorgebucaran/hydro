function fish_prompt --description Hydro
    echo -e "$_hydro_color_pwd$_hydro_pwd\x1b[0m $_hydro_color_git$$_hydro_git\x1b[0m$_hydro_color_duration$_hydro_cmd_duration\x1b[0m$$_hydro_addons$_hydro_status\x1b[0m "
end

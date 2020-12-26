function fish_prompt -d Hydro
    string unescape "$_hydro_color_pwd$_hydro_pwd_info\x1b[0m $_hydro_color_git$$_hydro_git_info\x1b[0m$_hydro_color_duration$_hydro_cmd_duration\x1b[0m$_hydro_prompt\x1b[0m "
end

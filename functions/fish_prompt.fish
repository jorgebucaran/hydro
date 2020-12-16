set --global _fly_git_status _fly_git_status_$fish_pid

function fish_prompt
    set --local last_status $pipestatus
    set --query _fly_init && set --erase _fly_init && _fly_fish_prompt && _fly_set_pwdinfo

    test (math +$last_status) = 0 \
        && set --local prompt $_fly_color_dim$_fly_symbol_prompt \
        || set --local prompt "$_fly_color_error"[(
            string join "$_fly_color_dim|$_fly_color_reset$_fly_color_error" $last_status
        )]"$_fly_color_reset"

    echo -n "$_fly_color_base$_fly_pwdinfo $$_fly_git_status$prompt$_fly_color_reset "
end

function _fly_set_pwdinfo --on-variable PWD
    set --query fish_prompt_pwd_dir_length || set --local fish_prompt_pwd_dir_length 1
    set --global _fly_pwdinfo (
        string replace --ignore-case -- ~ \~ $PWD | \
        string replace --all --regex -- "(\.?[^/]{$fish_prompt_pwd_dir_length})[^/]*/" \$1/
    )
end

function _fly_git_status --on-variable $_fly_git_status
    commandline --function repaint
end

function _fly_fish_prompt --on-event fish_prompt
    fish --command "    
        ! set branch (
            command git symbolic-ref --short HEAD 2>/dev/null || \
            command git describe --tags --exact-match HEAD 2>/dev/null || \
            command git rev-parse --short HEAD 2>/dev/null
        ) && set $_fly_git_status && exit

        command git rev-list --count --left-right @{upstream}...@ 2>/dev/null | read behind ahead
        
        switch \"\$behind \$ahead\"
            case \" \" \"0 0\"
            case \"0 *\"
                set upstream \" ↑\$ahead\"
            case \"* 0\"
                set upstream \" ↓\$behind\"
            case \*
                set upstream \" ↑\$ahead ↓\$behind\"
        end

        ! git diff-index --quiet HEAD || \
        count (command git ls-files --others --exclude-standard) >/dev/null && set state \*

        set --universal $_fly_git_status \"\$branch\$state\$upstream \"

        command git fetch --no-tags 2>/dev/null &
    " &
end   

function _fly_fish_exit --on-event fish_exit
    set --erase $_fly_git_status
end

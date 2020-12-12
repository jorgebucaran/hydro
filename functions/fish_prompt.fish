set --global _fly_git_status _fly_git_status_$fish_pid

function fish_prompt
    test "$pipestatus" = 0 || set --local error $_fly_color_error
    echo -n "$_fly_color_accent$_fly_pwdinfo$_fly_color_normal $$_fly_git_status$error%$_fly_color_normal "

    set --query _fly_start && \
        set --erase _fly_start && _fly_set_pwdinfo && _fly_fish_prompt
end

function _fly_set_pwdinfo --on-variable PWD
    set --query fish_prompt_pwd_dir_length || set --local fish_prompt_pwd_dir_length 1   
    set --global _fly_pwdinfo (
        string replace ~ \~ $PWD | \
        string replace --all --regex -- "(\.?[^/]{$fish_prompt_pwd_dir_length})[^/]*/" \$1/
    )
end

function _fly_git_status --on-variable $_fly_git_status
    commandline --function repaint
end

function _fly_fish_prompt --on-event fish_prompt
    fish --command "    
        if not set --local branch (
            command git symbolic-ref --short HEAD 2>/dev/null || \
            command git describe --tags --exact-match HEAD 2>/dev/null || \
            command git rev-parse --short HEAD 2>/dev/null
        ) 
            set _fly_git_status_$fish_pid 
            exit
        end

        set info \"(\$branch\"
        ! command git diff --no-ext-diff --quiet --exit-code 2>/dev/null || \
        ! command git diff --no-ext-diff --quiet --exit-code --cached 2>/dev/null && \
            set info \"\$info*\"

        set --universal _fly_git_status_$fish_pid \"\$info) \"
    " &
end   

function _fly_fish_exit --on-event fish_exit
    set --erase $_fly_git_status
end
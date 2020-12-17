function _fly_git_info --on-event fish_prompt
    fish --command "
        ! set branch (
            command git symbolic-ref --short HEAD 2>/dev/null || \
            command git describe --tags --exact-match HEAD 2>/dev/null || \
            command git rev-parse --short HEAD 2>/dev/null
        ) && set $_fly_git_info && exit

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

        set --universal $_fly_git_info \"\$branch\$state\$upstream \"

        command git fetch --no-tags 2>/dev/null &
    " &
end

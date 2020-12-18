function _fly_git_info --on-event fish_prompt
    fish --private --command "
        command kill $_fly_last_pid 2>/dev/null

        ! set branch (
            command git symbolic-ref --short HEAD 2>/dev/null || \
            command git describe --tags --exact-match HEAD 2>/dev/null || \
            command git rev-parse --short HEAD 2>/dev/null
        ) && set --universal $_fly_git_info && exit

        ! git diff-index --quiet HEAD || \
        count (command git ls-files --others --exclude-standard) >/dev/null && set state \*
            
        for step in fetch done
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

            set --universal $_fly_git_info \"$_fly_color_bold\$branch$_fly_color_reset$_fly_color_base\$state\$upstream \"
            test \$step = fetch && command git fetch --no-tags 2>/dev/null
        end
    " &
    set --global _fly_last_pid (jobs --last --pid)
end
# _Hydro_

A [Fish](https://fishshell.com) prompt with async instant Git status.

```console
~ ❱ hydro/
~/hydro dev* ❱ git add --all && git commit --message Bugfix
~/hydro dev ↑1 ❱ git push
...
~/hydro dev 3s ❱ ..
~ ❱ math 1/0
math: Error: Result is infinite
~ ❱ [1] ⎢
```

## Features

- Blazing fast async Git branch and status.
  - `*` indicates you have staged, unstaged, or untracked files.
  - `↑𝘕` indicates `𝘕` commits ahead of your upstream.
  - `↓𝘕` indicates `𝘕` commits behind of your upstream.
- Truncate `$PWD` prompt—supports [`$fish_prompt_pwd_dir_length`](https://fishshell.com/docs/current/cmds/prompt_pwd.html).
- Title set to `$PWD` and currently running command.
- Show last command duration if > `1` second.
- Show `$pipestatus`: `[1]`, `[1|0]`, etc.
- Best prompt symbol ever.
- vi-mode support! 👌

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/hydro
```

## License

[MIT](LICENSE.md)

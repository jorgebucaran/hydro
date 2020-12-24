# Hydro

> Minimal, lag-free prompt with async Git status. Made for [Fish](https://fishshell.com).

```console
~ ❱ hydro/
~/hydro dev• ❱ git add --all && git commit --message Hotfix
~/hydro dev ↑1 ❱ git push
...
~/hydro dev 3s ❱ ..
~ ❱ math 1/0
math: Error: Result is infinite
~ ❱ [1] ⎢
```

## Features

- Blazing fast async Git branch and status.
  - `•` indicates you have staged, unstaged, or untracked files.
  - `↑𝘕` indicates `𝘕` commits ahead of your upstream.
  - `↓𝘕` indicates `𝘕` commits behind of your upstream.
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

## Configuration

Modify variables using `set --universal` from the command line or `set --global` in your `config.fish` file.

### Symbols

| Variable                  | Default |
| ------------------------- | ------- |
| `hydro_symbol_prompt`     | ❱       |
| `hydro_symbol_git_dirty`  | •       |
| `hydro_symbol_git_ahead`  | ↑       |
| `hydro_symbol_git_behind` | ↓       |

### Colors

| Variable            | Default               |
| ------------------- | --------------------- |
| `hydro_color_error` | `$fish_color_error`   |
| `hydro_color_base`  | `$fish_color_command` |
| `hydro_color_pwd`   | `$fish_color_command` |

## License

[MIT](LICENSE.md)

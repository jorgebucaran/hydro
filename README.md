# Fly

Unobtrusive [Fish](https://fishshell.com) prompt with async Git status.

```console
~ ❯ fly/
~/fly main* ❯ git add -A && git commit -m Fly
~/fly main ↑1 ❯ git push
~/fly main ❯ false
~/fly main [1] ⎢
```

## Features

- Blazing fast async Git branch and status.
  - `*` indicates you have staged, unstaged, or untracked files.
  - `↑𝘕` indicates `𝘕` commits ahead of your upstream.
  - `↓𝘕` indicates `𝘕` commits behind of your upstream.
- Short `$PWD` prompt—supports [`$fish_prompt_pwd_dir_length`](https://fishshell.com/docs/current/cmds/prompt_pwd.html).
- Title set to `$PWD` and currently running command.
- Show `$pipestatus`: `[1]`, `[1|0]`, etc.
- Best prompt character ever.
- Sorry, no right prompt.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/fly
```

## License

[MIT](LICENSE.md)

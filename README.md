# Fly

Unobtrusive, minimal command-line prompt for [Fish](https://fishshell.com) that flies~%!

```shell
~ % fly/
~/fly (dev*) % git add -A && git commit -m Fly
~/fly (dev ↑1) % git push origin dev
~/fly (dev) % false
~/fly (dev) [1] ⎢
```

## Features

- Unambiguous prompt and status—don't purely rely on color.
- Last `$pipestatus` like `[1]`, `[1|1|0]`, and so on.
- Blazing fast async Git branch and status.
  - `*` indicates staged, unstaged, or untracked files exist.
  - `↑n` indicates `n` commits ahead of the remote HEAD.
  - `↓n` indicates `n` commits behind of the remote HEAD.
- Short `$PWD`—show only what matters.
- Sorry, no right prompt.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/fly
```

## License

[MIT](LICENSE.md)

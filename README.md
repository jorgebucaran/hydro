# Hydro

> Minimal, lag-free prompt with async Git status. Designed for [Fish](https://fishshell.com).

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/hydro
```

## Features

Best prompt symbol ever.

<pre>
<b>~</b> ❱ <b>⎢</b>
</pre>

Show Git branch name and status (prompt repaints asynchronously).

<pre>
~/p/<b>hydro</b> main ❱ touch Solution
~/p/<b>hydro</b> main• ❱ <b>⎢</b>
</pre>

> `•` indicates that there are staged, unstaged or untracked files.

Show how many commits you're ahead and/or behind of your upstream (prompt repaints asynchronously).

<pre>
~/p/<b>hydro</b> main• ↓2 ❱ git commit -am Hotfix
~/p/<b>hydro</b> main ↑1 ↓2 ❱ git pull --rebase && git push
~/p/<b>hydro</b> main ❱ <b><b>⎢</b></b>
</pre>

Show `$CMD_DURATION` if > `1` second.

<pre>
~/p/<b>hydro</b> main ❱ git push --quiet
~/p/<b>hydro</b> main 1.1s ❱ <b>⎢</b>
</pre>

Show `$pipestatus`.

<pre>
~/p/<b>hydro</b> main ❱ false
~/p/<b>hydro</b> main ❱ [<b>1</b>]
~/p/<b>hydro</b> main ❱ false | true | false
~/p/<b>hydro</b> main [<b>1</b>|<b>0</b>|<b>1</b>] <b>⎢</b>
</pre>

Truncate `$PWD` except for the current directory and Git root.

<pre>
<b>~</b> ❱ projects/hydro/
~/p/<b>hydro</b> ❱ functions/share
~/p/hydro/f/<b>share</b> ❱ <b>⎢</b>
</pre>

Show current bindings mode.

<pre>
<i>I</i> <b>~</b> ❱ 
<i>N</i> <b>~</b> ❱
<i>R</i> <b>~</b> ❱
<i>V</i> <b>~</b> ❱
</pre>

Set terminal title to `$PWD` and currently running command.

```console
fish ~/projects/hydro
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

| Variable            | Default              |
| ------------------- | -------------------- |
| `hydro_color_error` | `$fish_color_error`  |
| `hydro_color_base`  | `$fish_color_normal` |
| `hydro_color_pwd`   | `$fish_color_normal` |

## License

[MIT](LICENSE.md)

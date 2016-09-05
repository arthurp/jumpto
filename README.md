# jumpto
A set of bash scripts which allow jumping to directories in favorite locations quickly.
This makes this extremely similar to [Bourne Shell's CDPATH](https://www.gnu.org/software/bash/manual/bash.html#index-cd).
You should probably use that unless you need `jumpto`'s ability to have partial directory names in the `PATH` or you want to be able to modify the system without hacking on your shell internals.

Configure it as follows:
```[bash]
export JUMP_PATH=~/projects/:~/shared/projects/:~/documentset-
. ~/shared/jumpto/jumpto_config.sh
```
With this in `.bashrc`, the command `jp name` will search the directories 
`~/projects/` and `~/shared/projects/` for a subdirectory called `name` and 
will check for the existance of `~/documentset-name`. It will then `cd` to
the first one found, or the next in search order if the current directory 
is one in the list already. The exception is if `name` is a directory 
(relative to the current directory) it will simply change to that directory.
This is simply to make `jp` behave like `cd` if `cd` would have worked.

These scripts will only work in Bash. They use features that are not available
in Dash and similar.

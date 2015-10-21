title: About eval in Shell
categories:
  - Operating System
tags:
  - linux
  - shell
date: 2015-10-20 22:23:00
---
![](/img/os-linux-shell.png)
The textbook says in bash scripting, `eval` plays a role that the expression comes after will be evaluated twice before the final execution. By saying evaluation, it means the variables begining with `$` will be translated to whatever its value is.

Let's see some examples.

```bash
$ a='10'
$ b=a
```
Now b is assigned with `a`, and this `a` is simply a string, not a variable yet.

```bash
$ echo $a
10
$ echo $b
a
```

Now we execute these two variables in different ways:

```bash
$ $a
command not found: 10
$ `$a`
command not found: 10
$ $($a)
command not found: 10
$ eval $a
command not found: 10
$ eval `$a`
command not found: 10
$ eval $($a)
command not found: 10
```

```bash
$ $b
command not found: a
$ `$b`
command not found: a
$ $($b)
command not found: a
$ eval $b
command not found: a
$ eval `$b`
command not found: a
$ eval $($b)
command not found: a
```
But if we now evaluate `\$$b`, as we know `\` will escape the `$` sign, something interesting will show up.

```bash
# experiment 1
$ \$$b
command not found: $a

# experiment 2
$ `\$$b`
command not found: 99361b

# experiment 3
$ $(\$$b)
command not found: $a

# experiment 4
$ eval \$$b
command not found: 10

# experiment 5
$ eval `\$$b`
command not found: 99361b

# experiment 6
$ eval $(\$$b)
command not found: $a
```
Some conclusions may be drawn from the above experiments:

- Before each execution of command, the known variables in the expression will be converted to its value. As in experiment 1, `\$$b` is translated to `$a` before executing, then `$a` is executed as if it is a command, and apparently results in a not-found error. Another example would be

	```bash
	$ eval echo \$$b
	10
	```
	With `eval`, the entire expression will be evaluated twice. `\$$b` is translated to `$a` in the first place, then `echo $a` is executed. Similarly, `$a` is translated to `10` before this execution, and `10` is printed on screen as a result.

- There is difference between experiment 1 and 4 is because that `\$$b` is actually executing `$a` as a command, while `eval \$$b` will first convert $b into a, then evaluates again from `$a` to `10`. Now `10` is executed as a command.

- <code>\` \`</code> and `$()` are called "command substitution", which means the expression within will be evaluated and executed before the outside command gets in. The outside command usually is `echo`.
	- It is said that <code>\` \`</code> and `$()` should be interchangeable, however it apparently is not, judging from experiment 2 and 3.
	- From experiment 2 and 3, we could see that `$(\$$b)` seems to have been successfully translated `\$$b` into `$a`. But <code>\`\\$$b\`</code> seems to have first converted `\$$` into `$$`, which is the process ID of the current shell, then concatenated 'b' at the end and return.
	- Therefore a good guess is that <code>\` \`</code> grants higher priority to escaped characters than variables when evaluating.
	- It is recommended to use `$()` instead of <code>\` \`</code> for command substitution.

- Consider another example of using `eval` and `$()`:

	```bash
	$ eval echo \$$b
	10
	$ eval $(echo \$$b)
	command not found: 10
	$ $(echo \$$b)
	command not found: $a
	```
	- `eval echo \$$b` evaluated `\$$b` to `$a`, then evaluated `$a` to its value `10` before echoing it out, finally echoed the result.
	- `eval $(echo \$$b)` did the first three steps the same as above, but it has one more step, which was what `$()` did, to execute the result. Therefore you got a not-found error message.
	- `$(echo \$$b)` did the same as the second example, except the double evaluation part. That is, first evaluate `\$$b` to `$a`, which is associated with "echo"; then echoed it out as a string "$a"; lastly, ran it as a command, and received a not-found error said "command '$a' was not found".
# The Unix Shell: 4. Creating Things

> ### Learning Objectives
>
> *   Create a directory hierarchy that matches a given diagram.
> *   Create files in that hierarchy using an editor or by copying and renaming existing files.
> *   Display the contents of a directory using the command line.
> *   Delete specified files and/or directories.


### 1. Creating Things

We now know how to explore files and directories, but how do we create them in the first place? Let's go back to this unit's working directory, `PS239T/02_Unix-Bash`, and use `ls -F` to see what it contains:

```bash
$ cd ~/PS239T/02_Unix-Bash

/home/oski

$ ls -F

01_unix.md			  07_scripts.md
02_shell.md			 A1_Cheatsheet.md
03_filedir.md	 A2_Path-practice.pdf
04_create.md		 A3_Path-practice-answers.md
05_pipe.md			  data/
06_loop.md
```

Let's create a new directory called `thesis` using the command `mkdir thesis` (which has no output):

```bash
$ mkdir thesis
```

As you might (or might not) guess from its name, `mkdir` means "make directory". Since `thesis` is a relative path (i.e., doesn't have a leading slash), the new directory is created in the current working directory:

```bash
$ ls -F

01_unix.md          05_pipe.md          Cheatsheet.md
02_shell.md         06_loop.md          data/
03_fildir.md        07_scripts.md       thesis/
04_create.md        Assignment.md
```

However, there's nothing in it yet:

```bash
$ ls -F thesis
```

### 2. Text Editors

Let's change our working directory to `thesis` using `cd`, then run a text editor called Nano to create a file called `draft.txt`:

```bash
$ cd thesis
$ nano draft.txt
```
> #### Those of you who had nano installation problems, but were able to download Sublime Text, should be able to use "subl" wherever you see "nano" in the instructions. 


> #### Which Editor?
> 
> When we say, "`nano` is a text editor," we really do mean "text": it can
> only work with plain character data, not tables, images, or any other
> human-friendly media. We use it in examples because almost anyone can
> drive it anywhere without training, but please use something more
> powerful for real work. On Unix systems (such as Linux and Mac OS X),
> many programmers use [Emacs](http://www.gnu.org/software/emacs/) or
> [Vim](http://www.vim.org/) (both of which are completely unintuitive,
> even by Unix standards), or a graphical editor such as
> [Gedit](http://projects.gnome.org/gedit/), which is on BCE. 
> On Windows, you may wish to use [Notepad++](http://notepad-plus-plus.org/).
> 
> The default text editor on Mac OS X and Linux is usually set to Vim, which 
> is not famous for being intuitive. if you accidentally find yourself stuck 
> in it, try typing the escape key, followed by `:q!` (colon, lower-case 'q', 
> exclamation mark), then hitting Return to return to the shell.
> 
> Text editors are not limited to .txt files. Code is also text - so any
> file with an extension like .py (for python) .sh (for shell) can also be 
> edited in a text editor. So can files containing markup, like .html (for 
> HTML) or .md (for markdown). Markup is a way to format text (bold, lists,
> links, etc) using simple syntax.

Let's type in a few lines of text, then use Control-O to write our data to disk:

![nano](https://swcarpentry.github.io/shell-novice/fig/nano-screenshot.png)

Hit return to accept the filename. 

Once our file is saved, we can use `CTRL-X` to quit the editor and return to the shell. (Unix documentation often uses the shorthand `^A` to mean "control-A".) `nano` doesn't leave any output on the screen after it exits, but `ls` now shows that we have created a file called `draft.txt`:

```bash
$ ls

draft.txt
```

> #### Control Codes
> 
> The shell accepts a few special commands that allow users to interact with 
> running processes or programs. You can enter each of these “control codes” 
> by holding down the `CTRL` key and then pressing one of the control 
> characters. In other tutorials, you may see the `^`` character used to 
> represent the `CTRL` key (e.g. `^c` = `CTRL+c`).
> 
> * CTRL+c: Interrupts and cancels a running program. This is useful if you want to cancel a command that is taking too long to execute.
> * CTRL+d  Indicates the end of a file or stream of characters that you are entering on the command line.
> * CTRL+z  Suspends a process but does not terminate it. You can then use the command `fg` to restart the job in the foreground.
> For new shell users, these control codes can all appear to have the same 
> effect: they make things “go away.” But it is helpful to understand the 
> differences. In general, if something went wrong and you just want to get 
> your shell prompt back, it is better to use `CTRL+c`.

### 3. Removing

Let's tidy up by running `rm draft.txt`:

```bash
$ rm draft.txt
```

This command removes files ("rm" is short for "remove"). If we run `ls` again,its output is empty once more, which tells us that our file is gone:

```bash
$ ls
```

> #### Deleting Is Forever
> 
> Unix doesn't have a trash bin: when we delete files, they are unhooked
> from the file system so that their storage space on disk can be
> recycled. Tools for finding and recovering deleted files do exist, but
> there's no guarantee they'll work in any particular situation, since the
> computer may recycle the file's disk space right away.

Let's re-create that file and then move up one directory to `/home/oski` using `cd ..`:

```bash
$ pwd

/home/oski/PS239T/02_Unix-Bash/thesis

$ nano draft.txt
$ ls

draft.txt

$ cd ..
```

If we try to remove the entire `thesis` directory using `rm thesis`,
we get an error message:

```bash
$ rm thesis

rm: cannot remove 'thesis': Is a directory
```

This happens because `rm` only works on files, not directories. The right command is `rmdir`, which is short for "remove directory". It doesn't work yet either, though, because the directory we're trying to remove isn't empty:

```bash
$ rmdir thesis

rmdir: failed to remove 'thesis': Directory not empty
```

This little safety feature can save you a lot of grief, particularly if you are a bad typist. To really get rid of `thesis` we must first delete the file `draft.txt`:

```bash
$ rm thesis/draft.txt
```

The directory is now empty, so `rmdir` can delete it:

```bash
$ rmdir thesis
```

> #### With Great Power Comes Great Responsibility
> 
> Removing the files in a directory just so that we can remove the
> directory quickly becomes tedious. Instead, we can use `rm` with the
> `-r` flag (which stands for "recursive"):
> 
> ```
> $ rm -r thesis
> ```
> 
> This removes everything in the directory, then the directory itself. If
> the directory contains sub-directories, `rm -r` does the same thing to
> them, and so on. It's very handy, but can do a lot of damage if used
> without care.

### 4. Moving

Let's create that directory and file one more time. (Note that this time we're running `nano` with the path `thesis/draft.txt`, rather than going into the `thesis` directory and running `nano` on `draft.txt` there.)

```bash
$ pwd

/home/oski/PS239T/02_Unix-Bash

$ mkdir thesis
$ nano thesis/draft.txt
$ ls thesis

draft.txt
```

`draft.txt` isn't a particularly informative name, so let's change the file's name using `mv`, which is short for "move":

```bash
$ mv thesis/draft.txt thesis/quotes.txt
```

The first parameter tells `mv` what we're "moving", while the second is where it's to go. In this case, we're moving `thesis/draft.txt` to `thesis/quotes.txt`, which has the same effect as renaming the file. Sure enough, `ls` shows us that `thesis` now contains one file called `quotes.txt`:

```bash
$ ls thesis

quotes.txt
```

Just for the sake of inconsistency, `mv` also works on directories -- there is no separate `mvdir` command.

Let's move `quotes.txt` into the current working directory. We use `mv` once again, but this time we'll just use the name of a directory as the second parameter to tell `mv` that we want to keep the filename, but put the file somewhere new. (This is why the command is called "move".) In this case, the directory name we use is the special directory name `.` that we mentioned earlier.

```bash
$ mv thesis/quotes.txt .
```

The effect is to move the file from the directory it was in to the current working directory. `ls` now shows us that `thesis` is empty:

```bash
$ ls thesis
```

Further, `ls` with a filename or directory name as a parameter only lists that file or directory. We can use this to see that `quotes.txt` is still in our current directory:

```bash
$ ls quotes.txt

quotes.txt
```


### 5. Copying

The `cp` command works very much like `mv`, except it copies a file instead of moving it. We can check that it did the right thing using `ls` with two paths as parameters --- like most Unix commands, `ls` can be given thousands of paths at once:

```bash
$ cp quotes.txt thesis/quotations.txt
$ ls quotes.txt thesis/quotations.txt

quotes.txt   thesis/quotations.txt
```

To prove that we made a copy, let's delete the `quotes.txt` file in the current directory and then run that same `ls` again. This time it tells us that it can't find `quotes.txt` in the current directory, but it does find the copy in `thesis` that we didn't delete:

```bash
$ ls quotes.txt thesis/quotations.txt

ls: cannot access quotes.txt: No such file or directory thesis/quotations.txt
```



> ## Wildcards {.callout}
> 
> `*` is a **wildcard**. It matches zero or more
> characters, so `*.pdb` matches `ethane.pdb`, `propane.pdb`, and so on.
> On the other hand, `p*.pdb` only matches `pentane.pdb` and
> `propane.pdb`, because the 'p' at the front only matches itself.
> 
> `?` is also a wildcard, but it only matches a single character. This
> means that `p?.pdb` matches `pi.pdb` or `p5.pdb`, but not `propane.pdb`.
> We can use any number of wildcards at a time: for example, `p*.p?*`
> matches anything that starts with a 'p' and ends with '.', 'p', and at
> least one more character (since the '?' has to match one character, and
> the final '\*' can match any number of characters). Thus, `p*.p?*` would
> match `preferred.practice`, and even `p.pi` (since the first '\*' can
> match no characters at all), but not `quality.practice` (doesn't start
> with 'p') or `preferred.p` (there isn't at least one character after the
> '.p').
> 
> When the shell sees a wildcard, it expands the wildcard to create a
> list of matching filenames *before* running the command that was
> asked for. As an exception, if a wildcard expression does not match
> any file, Bash will pass the expression as a parameter to the command
> as it is. For example typing `ls *.pdf` in the new-york-times directory
> (which contains only files with names ending with `.TXT`) results in
> an error message that there is no file called `*.pdf`.
> However, generally commands like `wc` and `ls` see the lists of
> file names matching these expressions, but not the wildcards
> themselves. It is the shell, not the other programs, that deals with
> expanding wildcards, and this another example of orthogonal design.


## Exercises

#### Challenge 1

1. `cd` into the `PS239T/02_Unix-Bash/` directory
2. make a new directory with the path `data/new-york-times/2015-01-01`
2. list the files in the `data/downloads` directory.
3. copy all the files in the `data/downloads` directory into a new directory, `data/new-york-times/2015-01-01` (hint: use wildcards so that you don't have to do each one individually)

#### Challenge 2

What is the output of the closing `ls` command in the sequence shown below?
 
```
$ pwd
/home/jamie/data
$ ls
data.csv
$ mkdir recombine
$ mv data.csv recombine
$ cp recombine/data.csv ../data-saved.csv
$ ls
```

#### Challenge 3

Suppose that:
 
```
$ ls -F
analyzed/  nyt.csv    raw/   guardian.csv
```
 
What command(s) could you run so that the commands below will produce the 
output shown?
 
```
$ ls
analyzed   raw
$ ls analyzed
nyt.csv   guardian.csv
```

#### Challenge 4

What does `cp` do when given several filenames and a directory name, as in:

```
$ mkdir backup
$ cp thesis/citations.txt thesis/quotations.txt backup
```

What does `cp` do when given three or more filenames, as in:

```
$ ls -F
intro.txt    methods.txt    survey.txt
$ cp intro.txt methods.txt survey.txt
```

#### Challenge 5

The command `ls -R` lists the contents of directories recursively,
i.e., lists their sub-directories, sub-sub-directories, and so on
in alphabetical order at each level.

The command `ls -t` lists things by time of last change,
with most recently changed files or directories first.
In what order does `ls -R -t` display things?

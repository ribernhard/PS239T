---
title: Programming Fundamentals
subtitle: Reference
---

# Summaries and Resources

## [Unix](01_unix.md)

*   An operating system is a suite of programs which make the computer work.
*   UNIX is an very popular operating system, used on Macs and bunch of others.
*   UNIX has a kernel, file system, and programs.
*   Linux is an open source Unix-like system
*   Unix has three main components: kernael, shell, and file system.

## [Introducing the Shell](02_shell.md)

*   A shell is a program whose primary purpose is to read commands and run other programs.
*   The shell's main advantages are its high action-to-keystroke ratio,
    its support for automating repetitive tasks,
    and that it can be used to access networked machines.
*   The shell's main disadvantages are its primarily textual nature
    and how cryptic its commands and operation can be.

## [Files and Directories](03_filedir.md)

*   The file system is responsible for managing information on the disk.
*   Information is stored in files, which are stored in directories (folders).
*   Directories can also store other directories, which forms a directory tree.
*   `cd path` changes the current working directory.
*   `ls path` prints a listing of a specific file or directory;
    `ls` on its own lists the current working directory.
*   `pwd` prints the user's current working directory.
*   `whoami` shows the user's current identity.
*   `/` on its own is the root directory of the whole filesystem.
*   A relative path specifies a location starting from the current location.
*   An absolute path specifies a location from the root of the filesystem.
*   Directory names in a path are separated with '/' on Unix, but '\\' on Windows.
*   '..' means "the directory above the current one";
    '.' on its own means "the current directory".
*   Most files' names are `something.extension`.
    The extension isn't required,
    and doesn't guarantee anything,
    but is normally used to indicate the type of data in the file.
*   Most commands take options (flags) which begin with a '-'.
*   `~` stands for the user's home directory. Use it at the beginning of a path, like `~/path/to/file`
*   If you type enough letters of your command or argument, then you can press tab to have it automatically completed. 
	Double tab displays all the available options.
*	Up Arrow displays last command in the command line.
*	Copy a file/directory in the GUI and paste them into the command line to give the file/directory's full path.


## [Creating Things](04_create.md)

*   `cp old new` copies a file.
*   `mkdir path` creates a new directory.
*   `mv old new` moves (renames) a file or directory.
*   `rm path` removes (deletes) a file.
*   `rmdir path` removes (deletes) an empty directory.
*   `touch path` creates an empty file if it doesn't already exist.
*   Unix documentation uses '^A' to mean "control-A".
*   The shell does not have a trash bin: once something is deleted, it's really gone.
*   Nano is a very simple text editor --- please use something else for real work.
*   `*` is a wildcard. It matches zero or more characters
*   Naming/structuring your files and directories in a systematic way is important. 

## [Pipes and Filters](05_pipe.md)

*   `cat` displays the contents of its inputs.
*   `head` displays the first few lines of its input.
*   `tail` displays the last few lines of its input.
*   `sort` sorts its inputs.
*   `uniq` reports or filters out repeated lines in a file.
*   `wc` counts lines, words, and characters in its inputs.
*   `command > file` redirects a command's output to a file.
*   `first | second` is a pipeline: the output of the first command is used as the input to the second.
*   The best way to use the shell is to use pipes to combine simple single-purpose programs (filters).

## [Loops](06_loop.md)

*   `history` displays recent commands, and `!number` to repeat a command by number.
*   A `for` loop repeats commands once for every thing in a list.
*   Every `for` loop needs a variable to refer to the current "thing".
*   Use `$name` to expand a variable (i.e., get its value).
*   Do not use spaces, quotes, or wildcard characters such as '*' or '?' in filenames, as it complicates variable expansion.
*   Give files consistent names that are easy to match with wildcard patterns to make it easy to select them for looping.
*   Use the up-arrow key to scroll up through previous commands to edit and repeat them.
*   Use `history` to display recent commands, and `!number` to repeat a command by number.

## [Shell Scripts](07_scripts.md)

*   Save commands in files (usually called shell scripts) for re-use.
*   `bash filename` runs the commands saved in a file.
*   `$*` refers to all of a shell script's command-line parameters.
*   `$1`, `$2`, etc., refer to specified command-line parameters.
*   `$@` refer to all command-line parameters. Especially helpful for wildcards.
*   Place variables in quotes if the values might have spaces in them.
*   Letting users decide what files to process is more flexible and more consistent with built-in Unix commands.

## Finding Things: (Not covered, but helpful)

*   `find` finds files with specific properties that match patterns.
*   `grep` selects lines in files that match patterns.
*   `man command` displays the manual page for a given command.
*   `*` matches zero or more characters in a filename, so `*.txt` matches all files ending in `.txt`.
*   `?` matches any single character in a filename, so `?.txt` matches `a.txt` but not `any.txt`.
*   `$(command)` inserts a command's output in place.
*   Find the whole lesson [here](http://software-carpentry.org/v5/novice/shell/06-find.html)

## [Getting Help](08_Help.md)

*   Don't learn specific programming languages; learn *how to program*
*   Most of your programming will be spent debugging, looking things up on the internet, and testing. 
*   Google errors!


## Glossary

absolute path
:  or a full path, points to the location of a filesystem object (i.e.,file, directory or link) in a file system regardless of the current working directory. It must contain the root directory.

argument
:  the value to which a function (or a command) refers. For example, in cp thesis.txt, thesis.txt is the argument. In f(6), 6 is the argument. Some people on the interwebs (e.g., [here] (http://www.quora.com/What-is-an-Argument-in-Programming-means), have tried to explain the difference between arguments and parameters. The former represents the "value" or "instance" passed to the function, and the latter represent the "variable" or "type."

command shell
:   a command-line, or non-graphical, user interface that provides access to an operating system's services.  It is an environment for direct communication between the user and the operating system using a command-line interface (CLI).

command-line interface
: A CLI (command line interface) is a user interface to a computer's operating system or an application in which the user responds to a visual prompt by typing in a command on a specified line, receives a response back from the system, and then enters another command, and so forth.

comment
:   text added to code syntax which is ignored by the computer/compiler but provides guidance to coders for debuging and review.  Generally specifies the purpose of following code as well as helpful hints

current working directory
:   current working directory is our current default directory, i.e., the directory that the computer assumes we want to run commands in unless we explicitly specify something else.

file system
:   FIXME

filename extension
:   A filename extension is a suffix appended to a name that identifies the file format, file type, and/or indended usage of that file. It is often separated from the base filename by a dot or space.

filter
:   FIXME

flag
:   FIXME

graphical user interface
:   also called gui. This is how the user sees information represented on the computer screen, ie. directories as folders.

home directory
:   The home directory is often the directory users find themselves in when they first log-in to their computer. It serves as a repository for the user's files such as their documents, programs, desktop, etc. Different users on the same computer have different home directories. You can access your home directory in Git-Bash by entering cd ~ . 

loop
: is a sequence of instructions that repeats either a specified number of times or until a particular condition is met.

loop body
:   it is the specific statement or condition based on specified boundaries that is going to be repeated or looped, it is also called code block and goes between {}. 

orthogonal
:   FIXME

parent
:   A parent is one level up from where you are located.

pipe
:  A vertical bar between two commands. It allows use of output of the first command (on the left) as input for the second command (on the right)

process
:   FIXME

prompt
:   FIXME

quoting
:   FIXME

read-evaluate-print loop
:   (REPL) takes a single command line (or expression), evaluates it, and then outputs the results (prints them).

redirect
:   Allows you to direct the input and ouput of a command to and from other files and programs. Also capable of chaining commands together in a pipeline.

regular expressions
:   abbreviated regex or regexp, is a sequence of characters to search for patterns. It is used most commonly in pattern matching with strings. One example of its application is in "find-and-replace" type of operations.



relative path
: relative path tells ls how to find something from where we are, rather than from the root of the file system.
  
example: $ ls -F data
The output shows us that there are four text files and two sub-sub-directories

root directory
:   The root directory (sometimes just the root) is the first directory in a hierarchical file system. 

shell script
:   a bunch of commands saved in a file; a small program

standard input
:   standard input, abbreviated as stdin, is information inputted into the terminal through the keyboard or input device.

standard output
:   FIXME

sub-directories
:   FIXME

tab completion
:   A method to autocomplete file paths; hit tab and the file name will complete. 

uniq
:   The command uniq removes (ONLY!) adjacent duplicated lines from its input.

variable
:   A variable is a named storage location containing a set of information values.

wildcard
: An asterisk ('*'). Represents any number of characters (including zero, i.e. zero or more characters).

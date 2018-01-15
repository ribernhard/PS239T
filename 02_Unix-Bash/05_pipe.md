# The Unix Shell: 5. Pipes and Filters

> ### Learning Objectives
> *   Redirect a command's output to a file.
> *   Process a file instead of keyboard input using redirection.
> *   Construct command pipelines with two or more stages.
> *   Explain what usually happens if a program or pipeline isn't given any input to process.
> *   Explain Unix's "small pieces, loosely joined" philosophy.

Now that we know a few basic commands, we can finally look at the shell's most powerful feature: the ease with which it lets us combine existing programs in new ways.

### 1. Counting

We'll start with a directory called `data/articles` that contains text files of news articles. They are organized by the region they cover. So africa1.txt is the first article about Africa, africa2.txt the second and so on.

```shell
$ ls data/articles
```

Wow, that's a lot of files!

Let's go into that directory with `cd` and run the command `wc africa*.txt`.
`wc` is the "word count" command: it counts the number of lines, words, and characters in files. Remember that the `*` in `africa*.txt` matches zero or more characters, so the shell turns `africa*.txt` into a complete list of `.txt` files that start with `africa`:

```shell
$ cd data/articles
$ wc africa*.txt

      ...
       1     101     608 africa95.txt
       1    1576    9632 africa96.txt
       1     515    3218 africa97.txt
       1     653    4177 africa98.txt
       1     597    3748 africa99.txt
     136   70982  442767 total
```


If we run `wc -l` instead of just `wc`, the output shows only the number of lines per file:

```shell
$ wc -l africa*.txt

      ...
       1 africa94.txt
       1 africa95.txt
       1 africa96.txt
       1 africa97.txt
       1 africa98.txt
       1 africa99.txt
     136 total
```

So we see that each article has only 1 lines. How can this be, if the number of words vary so widely? Open a file and try to guess why.

We can also use `-w` to get only the number of words, or `-c` to get only the number of characters.

Which of these files is shortest? It's an easy question to answer when there are only a few files, but what if there were 6000?

### 2. Redirecting and Printing

Our first step toward a solution is to run the command:

```shell
$ wc -w africa*.txt > lengths
```

The `>` tells the shell to **redirect** the command's output to a file instead of printing it to the screen. The shell will create the file if it doesn't exist, or overwrite the contents of that file if it does.

(This is why there is no screen output: everything that `wc` would have printed has gone into the file `lengths` instead.) `ls lengths` confirms that the file exists:

```shell
$ ls lengths

lengths
```

We can now send the content of `lengths` to the screen using `cat lengths`.
`cat` stands for "concatenate": it prints the contents of files one after another. There's only one file in this case, so `cat` just shows us what it contains:

```shell
$ cat lengths

    ...
   101 africa95.txt
  1576 africa96.txt
   515 africa97.txt
   653 africa98.txt
   597 africa99.txt
   591 africa9.txt
```

### 3. Sorting

Now let's use the `sort` command to sort its contents. We will also use the -n flag to specify that the sort is  numerical instead of alphabetical. This does *not* change the file; instead, it sends the sorted result to the screen:

```shell
$ sort -n lengths

   ...
  1143 africa134.txt
  1155 africa43.txt
  1227 africa25.txt
  1329 africa24.txt
  1576 africa96.txt
```

We can put the sorted list of lines in another temporary file called `sorted-lengths` by putting `sorted-lengths` after the command, just as we used `lengths` to put the output of `wc` into `lengths`. Once we've done that,
we can run another command called `head` to get the first few lines in `sorted-lengths`:

```shell
$ sort -n lengths > sorted-lengths
$ head -1 sorted-lengths

   70 africa49.txt
```

Using the parameter `-1` with `head` tells it that we only want the first line of the file; `-20` would get the first 20, and so on. Since `sorted-lengths` contains the lengths of our files ordered from least to greatest, the output of `head` must be the file with the fewest lines.

### 4. Pipes

If you think this is confusing, you're in good company: even once you understand what `wc`, `sort`, and `head` do, all those intermediate files make it hard to follow what's going on. We can make it easier to understand by running `sort` and `head` together:

```shell
$ sort -n lengths | head -1

   70 africa49.txt
```

The vertical bar between the two commands is called a **pipe**. It tells the shell that we want to use the output of the command on the left as the input to the command on the right. The computer might create a temporary file if it needs to, or copy data from one program to the other in memory, or something else entirely; we don't have to know or care.

We can use another pipe to send the output of `wc` directly to `sort`, which then sends its output to `head`:

```shell
$ wc -w africa*.txt | sort -n | head -1

  70 africa49.txt
```

This is exactly like a mathematician nesting functions like *log(3x)*
and saying "the log of three times *x*". In our case, the calculation is "head of sort of line count of `africa*.txt`".

We can use this logic in many different combinations. For instance, to see how many files are in this directory, we can command:

```shell
$ ls -1 | wc -l

  958
```

This uses `wc` to do a count of the number of lines (`-l`) in the output of `ls -1`.

### 5. Processes, Inputs, Outputs, and Filters

Here's what actually happens behind the scenes when we create a pipe. When a computer runs a program --- any program --- it creates a **process** in memory to hold the program's software and its current state. Every process has an input channel called **standard input**. (By this point, you may be surprised that the name is so memorable, but don't worry: most Unix programmers call it "stdin". Every process also has a default output channel called **standard output** (or "stdout").

The shell is actually just another program. Under normal circumstances, whatever we type on the keyboard is sent to the shell on its standard input, and whatever it produces on standard output is displayed on our screen. When we tell the shell to run a program, it creates a new process and temporarily sends whatever we type on our keyboard to that process's standard input, and whatever the process sends to standard output to the screen.

Here's what happens when we run `wc -w africa*.txt > lengths`. The shell starts by telling the computer to create a new process to run the `wc` program. Since we've provided some filenames as parameters, `wc` reads from them instead of from standard input. And since we've used `>` to redirect output to a file, the shell connects the process's standard output to that file.

If we run `wc -w africa*.txt | sort -n` instead, the shell creates two processes (one for each process in the pipe) so that `wc` and `sort` run simultaneously. The standard output of `wc` is fed directly to the standard input of `sort`; since there's no redirection with `>`, `sort`'s output goes to the screen. And if we run `wc -w africa*.txt | sort -n | head -1`, we get three processes with data flowing from the files, through `wc` to `sort`, and from `sort` through `head` to the screen.

This simple idea is why Unix has been so successful. Instead of creating enormous programs that try to do many different things, Unix programmers focus on creating lots of simple tools that each do one job well, and that work well with each other. This programming model is called "pipes and filters". We've already seen pipes; a **filter** is a program like `wc` or `sort` that transforms a stream of input into a stream of output. Almost all of the standard Unix tools can work this way: unless told to do otherwise, they read from standard input, do something with what they've read, and write to standard output.

The key is that any program that reads lines of text from standard input
and writes lines of text to standard output can be combined with every other program that behaves this way as well. You can *and should* write your programs this way so that you and other people can put those programs into pipes to multiply their power.

> #### Redirecting Input
> As well as using `>` to redirect a program's output, we can use `<` to
> redirect its input, i.e., to read from a file instead of from standard
> input. For example, instead of writing `wc africa1.txt`, we could write
> `wc < africa1.txt`. In the first case, `wc` gets a command line
> parameter telling it what file to open. In the second, `wc` doesn't have
> any command line parameters, so it reads from standard input, but we
> have told the shell to send the contents of `africa1.txt` to `wc`'s
> standard input.

## Exercises

#### Challenge 1

1. cd into the `data/new-york-times/2015-01-01` directory
2. list the line count of each file
3. concatenate all of these text files into one big text file called `all.TXT`
4. list the line count of `all.TXT`

#### Challenge 2

If we run `sort` on this file:

```shell
10
2
19
22
6
```
 
the output is:
 
```shell
10
19
2
22
6
```

If we run `sort -n` on the same input, we get this instead:

```shell
2
6
10
19
22
```

Explain why `-n` has this effect.

#### Challenge 3

What is the difference between:

```shell
wc -l < mydata.dat
```

and:

```shell
wc -l mydata.dat
```

#### Challenge 4

The command `uniq` removes adjacent duplicated lines from its input.
For example, if a file `salmon.txt` contains:

```shell
coho
coho
steelhead
coho
steelhead
steelhead
```

then `uniq salmon.txt` produces:

```shell
coho
steelhead
coho
steelhead
```

Why do you think `uniq` only removes *adjacent* duplicated lines? (Hint: think about very large data sets.) What other command could you combine with it in a pipe to remove all duplicated lines?

#### Challenge 5

A file called `animals.txt` contains the following data:

```shell
2012-11-05,deer
2012-11-05,rabbit
2012-11-05,raccoon
2012-11-06,rabbit
2012-11-06,deer
2012-11-06,fox
2012-11-07,rabbit
2012-11-07,bear
```

What text passes through each of the pipes and the final redirect in the pipeline below?

```shell
cat animals.txt | head -5 | tail -3 | sort -r > final.txt
```

#### Challenge 6

The command:
 
```shell
$ cut -d , -f 2 animals.txt
```

produces the following output:
 
```shell
deer
rabbit
raccoon
rabbit
deer
fox
rabbit
bear
```
 
What other command(s) could be added to this in a pipeline to find
out what animals the file contains (without any duplicates in their
names)?

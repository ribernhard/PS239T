# Python Basics: 0-1 Introduction.

Lectures draw heavily upon material from the D-Lab Python Intensives course, but with additional homeworks. These lectures will teach you how to:

1. Run Python from both the Shell and in an IPython (Jupyter) Notebook
2. Write basic commands using Python syntax
3. Grasp the major utilities of Python [object](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#object) [types](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#type), including [integers](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#integer), [floats](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#floating-point-number), [strings](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#string), lists, sets, and dictionaries
4. Operate and manipulate those objects
5. Integrate choices into your programs using [conditionals](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#conditional-statement)


# What is Programming

> ## Learning Objectives
>
> *   Explain the difference between knowing a programming language and knowing how to program.
> *   Explain how programming languages can differ.
> *   Give useful debugging tips.
> *   Offer helpful resource websites.
> *   Explain how to google an error.

### What it means to "know how to program"

Most programmers can program in more than one language. That's because they know *how to program* generally, as opposed to "knowing" Python, R, Ruby, or whatever. (Remember, this is our metaphor about learning *syntax* versus learning *vocabulary*; learning specific languages is mostly about learning vocabulary).  

In other words, programming is an extensible skill. Basic programming concepts -- conditionals, for loops, functions -- can be found in almost any programming language.

That being said, programming languages differ from one another in the following ways:

1. **Syntax**: whether to add a semicolon at the end of each line, etc.
2. **Usage**: JavaScript is for building websites, R is for statistics, Python is general purpose, etc.
3. **Level**: how close you are to the hardware. 'C' is often considered to be the lowest (or one of the lowest) level languages.
4. **Object-oriented:** "objects" are data + functions. Some programming languages are object-oriented (e.g. Python) and some aren't (e.g. C).
5. **Many more**: Here's a [list](https://en.wikipedia.org/wiki/List_of_programming_languages_by_type) of all the types of programming languages out there.

So what should your first programming language be? That is, what programming language should you use to learn *how to program*? At the end of the day, the answer depends on what you want to get out of programming. Many people recommend Python because it's fun, easy, and multi-purpose. Here's an [article](http://lifehacker.com/which-programming-language-should-i-learn-first-1477153665) that can offer more advice.

Regardless of what you choose, you will probably grow 'comfortable' in one language while learning the basic concepts and skills that allow you to 'hack' your way into other languages.  

Thus "knowing how to program" means learning how to *think* like a programmer, not necessarily knowing all the language-specific commands off the top of your head. **Don't learn specific programming languages; learn how to program.**

### What programming is like

![xkcd](http://sslimgs.xkcd.com/comics/wisdom_of_the_ancients.png)

Here's the sad reality: When you're programming, 80% or more of your time will be spent debugging, looking stuff up (like program-specific syntax, [documentation](https://github.com/dlab-berkeley/python-intensive/blob/master/Glossary.md#documentation) for packages, useful functions, etc.), or testing. This does not just apply to beginner or intermediate programmers, although you will grow more "fluent" over time.

If you're a good programmer, you're a good detective!

### Debugging

1. Read the errors!
2. Read the documentation
2. Make it smaller
3. Figure out what changed
4. Check your syntax
5. Print statements are your friend

### Googling Errors

* google: name-of-program + text in error message
* Remove user- and data-specific information first!
* See if you can find examples that do and don’t produce the error

# Differences Between R and Python 3

## Similarities
* Python 3, like R, is a *functionalized* language (Python 2 is not). This means that commands (usually verbs or package functions) are followed by parentheses, e.g., `help()`. 
* By extension, this means that Python is also an *object-oriented* language. However, it does not store data in memory the same way that R does. 
* Both languages are open-source (with all the costs and benefits that entails). 
* The overall syntax is fairly similar: R and Python are both descendants of C and C++ (like French and Spanish are both Indo-European languages). 

## Differences
* Python is *white-space sensitive*. This means that the number of spaces you type or indent (using the tab function) on a multi-line piece of code will affect whether the code you've written runs correctly. An incorrect number of spaces will cause Python to return an error, which is often referred to as a "scoping" problem. Javascript is also very sensitive to scoping. 
* Python has informative errors. This means that it will tell you where the error occurred, and usually, why it occurred (e.g., missing parenthesis). 
* Where R uses piping (using the magrittr package, which runs "under the hood" of dplyr), Python uses a very simple dot syntax. 
* Python doesn't store everything in memory the way R does, and it's processed at a lower level than in R, which means that all else being equal, Python will be faster to execute than R. 
* Python doesn't have an IDE similar to RStudio, which means the interface is fairly different (though the process of typing a script in a notebook is very similar to an R-markdown file). 

## Other Considerations
* Python is a multi-use or generalist-type programming language, whereas R is a statistical language built specifically for manipulating data. That means that Python has tons of packages for things social scientists will never dream of using. However, R has much more specific and tailored capabilities where it comes to things like analyzing and visualizing data. 
* Programming language specialization varies a lot by discipline and disciplinary methodologies. R is used much more often by highly quantitative disciplines. In contrast, the first text analysis and scraping packages were written for Python, not for R, so disciplines that focus heavily on text are much more likely to teach Python. Likewise, CS-type disciplines will probably use Python, as it has more utility for those heading into software engineering jobs. 
* These pages have a good summary of some key differences (and attendant advances in each): 
** https://elitedatascience.com/r-vs-python-for-data-science
** https://learnanalyticshere.wordpress.com/2015/05/14/clash-of-the-titans-r-vs-python/

# Go!

Go! is a bash shell script to change the current working directory to one in a list of directories of your own.

It is intended to change quickly to frequently used directories, instead of having to use full paths or many *cd* commands to go from one directory to another.

## Getting Started

These instructions will get you a copy of Go! up and running on your local machine.

### Prerequisites

![GNU bash](assets/BASH_logo-transparent-bg-bw.png?raw=true "GNU bash")

Go! has been tested with:

* *GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin15)
Copyright (C) 2007 Free Software Foundation, Inc.*

* *GNU bash, version 4.3.11(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2013 Free Software Foundation, Inc.*

There is a slight difference between linux and mac versions. Download the one that suites your OS.

### Installing

Just download the file *go.sh* you'll find in [src folder](src) folder (linux or mac version) and copy it in the directory of your choice, it doesn't need to be in your path.

Once copied, you must create an alias like this:

```
alias go='. /full/path/to/script/go.sh'
```

For example, if you place go.sh in a directory called *bashscripts* in your home folder, then you must create this alias:

```
alias go='. ~/bashscripts/go.sh'
```

**This is important since when you change directory within a script's shell, when the script finishes that shell exits, and then you are left in the directory you were. Doing it this way, you *source* the script instead of running it. Sourcing will run the script commands in the current shell process, therefore the command *cd* will have effect in it.**

### Basic usage

```
go [directory-name]
```

By typing this, your working directory will be changed to *directory-name*, wherever in your system it is.

**Important note:** Previously, you had to add *directory-name* to the list of directories Go! will use. You can do this by typing:

```
cd /path/to/directory-name
go -a
```

### Full list of options

```
go [directory] [-a] [-l] [-r directory] [-h]
```
Command | Function
------- | -----------------------
**go [directory-name]**|Changes current working directory to directory-name. directory-name should have been added previously (see go -a).
**go -a, -add**|Adds current working directory to the list of directories Go! will work with.
**go -l, -list**|Shows full list of directories that have been added to Go!.
**go -r, -remove [directory-name]**|Removes [directory-name] from the list, i.e., go -r foo removes directory foo and can not be used again, unless it is newly added.
**go -h, -help**|Shows Go! help.

## Credits

**Alvaro Piqueras** - [pqrs](https://github.com/pqrs)

Go! was born under MS-DOS somewhen between 1993 and 1995, can't remember exactly. First as an MS-DOS batch script (although highly powered with [4DOS](https://en.wikipedia.org/wiki/4DOS)), and later as a compiled program written in C. All that code is [lost in time like tears in rain](https://en.wikipedia.org/wiki/Tears_in_rain_monologue). Those versions of Go! scanned all the directories in the hard drive and you could use Go! to go to any of them.

Many years after, in 2009, I ported the idea to GNU bash. Now you have to indicate what directories you want to use it with, adding them one at a time, since systems nowadays have lots of them, many with repeated names. I probably used some code I found somewhere online since I didn't have much bash skills then, but can't say how much or whose it was, sorry. Now, I'm learning about GitHub, one of my (many) unfinished businesses, so this is why you find this code here :)

Hope it helps you as much as me. I just can't live without it.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

Permissions of this license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.
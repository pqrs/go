# Go!

Go! is a bash shell script to change the current working directory to one in a list of frequently used directories of your own.

## Getting Started

These instructions will get you a copy of Go! up and running on your local machine.

### Prerequisites

![GNU bash](assets/BASH_logo-transparent-bg-bw.png?raw=true "GNU bash")

Go! has been tested with:

* *GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin15)
Copyright (C) 2007 Free Software Foundation, Inc.*

### Installing

You must download go.sh and copy it in the directory of your choice, it doesn't need to be in your path.

Once copied, you must create an alias like this:

```
alias go='. /full/path/to/script/go.sh'
```

For example, if you place go.sh in a directory called bashscripts in your home folder, then you create this alias:

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

**go [directory-name]**
Changes current working directory to directory-name. directory-name should have been added previously (see go -a).

**go -a, -add**
Adds current working directory to the list of directories Go! will work with.

**go -l, -list**
Shows full list of directories that have been added to Go!.

**go -r, -remove [directory-name]**
Removes [directory-name] from the list, i.e., go -r foo removes directory foo and can not be used again, unless it is added again.

**go -h, -help**
Shows Go! help.
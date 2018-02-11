# Go!

Go! is a bash shell script to change the current working directory to one in a list of frequently used directories of your own.

## Getting Started

These instructions will get you a copy of Go! up and running on your local machine.

### Prerequisites

![Alt text](assets/BASH_logo-transparent-bg-bw.png?raw=true "GNU bash")

Go! has been tested with:

* *GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin15)
Copyright (C) 2007 Free Software Foundation, Inc.*

### Installing

You must download go.sh and copy it in a directory in your PATH, e.g., if you place it in ~/bashscripts and that folder it is not in your PATH you should add it with:

´´´
PATH=$PATH:~/bashscripts
´´´

### Using it

Once copied in your system and added to your PATH, you can just use it by typing:

´´´
go.sh [directory-name]
´´´

For example, to go to *my-folder* directory:

´´´
go.sh my-folder
´´´

It is strongly recommended that you create an alias to save you some typing, e.g. *go*:

´´´
alias go=go.sh
´´´


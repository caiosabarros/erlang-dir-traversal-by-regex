# Local File Extension Searcher

## Overview

This is a file extension searcher in the erlang language. You provide the paths to the folders you want to search for a specific file extension, then you have the result of all the files logged into stdout. 

Features include:
- [x] Local file search based on regex expressions.
- [x] It supports up to 5 folders to be searched in.
- [x] It counts and displays the total amount of files matching the regex expression found.

### Description
The software is intended to help me find local files of a particular extension. However, I can look for files with any custom regex expression, which is the ultimate feature of the program. The program also supports up to 5 different folder paths to have a look at files which match the regex expression.

### Motivation
The purpose for writing this program was to have an easier way to find the local files that matched a particular regex expression. This is useful if you have a database of any kind on your computer with many files and folders available. The program supports using regex, which can be used to find specific files by their name, extension, folder path or anything you can come up with. The software also displays how many files were found. 

## Development Environment

The tools used to develop this software were:
- [Erlang](https://www.erlang.org/doc/readme.html)
- [Escript](https://www.erlang.org/docs/17/man/escript)

The main tools and libraries used were:
- [Vim]()
- [VsCode]()
- [filelib](https://www.erlang.org/doc/apps/stdlib/filelib.html#fold_files/5)
- [io](https://www.erlang.org/doc/apps/stdlib/io.html)

# Useful Websites

* [Learn You Some Erlang](https://learnyousomeerlang.com/content)
* [Erlang](https://www.erlang.org/doc/readme.html)

# Future Work

* Add support for any number of folder paths passed as arguments to the Escript script.
* Add functionality where the total amount of files found in different folders is added up and shown in stdout (currently, we show the total for each folder separatedly).

## Erlang

This project uses some of Erlang's basic functionality and concepts, like the following:

- [x] Display output to the screen using format. (cli arguments are being displayed on stdout through io:format)
- [x] Pattern Matching in function parameters. (main function does pattern matching on its arguments to determine its behavior)
- [x] Recursion. (used in filelib:fold_files method)
- [x] Guards. (used in validate_directory function definition)
- [x] Lists. (used everywhere in Erlang and in the software code)
- [x] Using lambda functions with lists:map, lists:filter, or lists:fold (used lists:map multiple times)

Additionally, it makes use of the:

-[x] `case of` coding block

#!/usr/bin/env escript

% main entrypoint for escript scripts
% it accepts Args as arguments and check their types using the case of block expression.
main(Args) ->
	case Args of
		[Folder,Regex] ->
			% log the arguments 
			io:format("Args ~p~n",[Args]),
			% check the input are folders indeed
			Results = check_folder(Folder),
			check_results(Results),
			% recursively find files
			recursive_find_files(Folder, Regex);

		[Folder, SecondFolder, Regex] -> 
			% log the arguments 
			io:format("Args ~p~n",[Args]),
			% define the folders
			Folders = [Folder, SecondFolder],
			% check the input are folders indeed
			Results = check_folder(Folders),
			check_results(Results),
			% organize parameters
			Tuplelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tuplelize, Folders),
			% recursively find files
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		[Folder, SecondFolder, ThirdFolder, Regex] -> 
			% log the arguments 
			io:format("Args ~p~n",[Args]),
			% define the folders
			Folders = [Folder, SecondFolder, ThirdFolder],
			% check the input are folders indeed
			Results = check_folder(Folders),
			check_results(Results),
			% organize parameters
			Tuplelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tuplelize, Folders),
			% recursively find files
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		[Folder, SecondFolder,  ThirdFolder, FourthFolder, Regex] -> 
			% log the arguments 
			io:format("Args ~p~n",[Args]),
			% define the folders
			Folders = [Folder, SecondFolder,  ThirdFolder, FourthFolder],
			% check the input are folders indeed
			Results = check_folder(Folders),
			check_results(Results),
			% organize parameters
			Tuplelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tuplelize, Folders),
			% recursively find files
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		[Folder, SecondFolder, ThirdFolder, FourthFolder, FifthFolder, Regex] -> 
			% log the arguments 
			io:format("Args ~p~n",[Args]),
			% define the folders
			Folders = [Folder, SecondFolder, ThirdFolder, FourthFolder, FifthFolder],
			% check the input are folders indeed
			Results = check_folder(Folders),
			check_results(Results),
			% organize parameters
			Tuplelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tuplelize, Folders),
			% recursively find files
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		_ ->
			usage()
	end;
% pattern matching based function to determine how the inputs are treated. In case it is not a list
% the program will pattern match to this case, showing the user how to use the program adequately. 
main(_) ->
	usage().

% command line interface helper function for the user to learn how to use this program.
usage() -> 
	io:format("------------------------------------------------------------------------~n"),
	io:format("---------------------------------USAGE----------------------------------~n"),
	io:format("------------------------------------------------------------------------~n"),
	io:format("$ ./searcher.escript /path/to/folder1 <regex>---------------------------~n"),
	io:format("--- If you want to search in two folders simultenously, do the below ---~n"),
	io:format("$ ./searcher.escript /path/to/folder /path/to/folder1 regex-pattern-here~n"),
	io:format("-------------- And so on up to five different folders ------------------~n"),
	io:format("-------------OPS: All folder paths must be paths to folders.------------~n").

% function to initialize the process of validation of input params given by the user
% checking whether the inputs actually represent folders.
check_folder(Dirs) ->
	lists:map(fun(Dir) -> filelib:is_dir(Dir) end, Dirs).

% helper function to check each result from is_dir function
check_results(Results) ->
	lists:foreach(fun (Result) -> validate_directory(Result) end, Results).

% function to validate if the directory is indeed a directory
% it receives a value from is_dir and makes sure that value is treated appropriately 
validate_directory(Boolean) when Boolean == true ->
	ok;
validate_directory(Boolean) when Boolean == false ->
	exit(some_folder_argument_is_not_a_directory).

% function to recursively find the files given a regex expression
% it uses a built-in library called filelib and the method fold_files
recursive_find_files(Folder,Regex) ->
	% transform the second parameter of io:format into a list so we have it all logged out
	io:format("~p~n", [filelib:fold_files(Folder, Regex, true, fun(File, Acc) ->
		% below we have two different tokens because we specifically target the list elements
		io:format("File ~p: ~s~n", [Acc, File]),
		Acc + 1
	end, 1)]).

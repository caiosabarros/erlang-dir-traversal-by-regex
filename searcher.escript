#!/usr/bin/env escript

main(Args) ->
	case Args of
		[Folder,Regex] -> 
			io:format("Args ~p~n",[Args]),
			Results = check_folder(Folder),
			check_results(Results),
			recursive_find_files(Folder, Regex);

		[Folder, SecondFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder],
			Results = check_folder(Folders),
			check_results(Results),
			Tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tupelize, Folders),
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		[Folder, SecondFolder, ThirdFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder, ThirdFolder],
			Results = check_folder(Folders),
			check_results(Results),
			Tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tupelize, Folders),
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		[Folder, SecondFolder,  ThirdFolder, FourthFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder,  ThirdFolder, FourthFolder],
			Results = check_folder(Folders),
			check_results(Results),
			Tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tupelize, Folders),
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		[Folder, SecondFolder, ThirdFolder, FourthFolder, FifthFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder, ThirdFolder, FourthFolder, FifthFolder],
			Results = check_folder(Folders),
			check_results(Results),
			Tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(Tupelize, Folders),
			lists:map(fun(FolderRegex) -> 
			{F, R} = FolderRegex,
			recursive_find_files(F,R) end, 
			FoldersWithRegex);

		_ ->
			usage()
	end;
main(_) ->
	usage().

usage() -> 
	io:format("------------------------------------------------------------------------~n"),
	io:format("---------------------------------USAGE----------------------------------~n"),
	io:format("------------------------------------------------------------------------~n"),
	io:format("$ ./searcher.escript /path/to/folder1 <regex>---------------------------~n"),
	io:format("--- If you want to search in two folders simultenously, do the below ---~n"),
	io:format("$ ./searcher.escript /path/to/folder /path/to/folder1 regex-pattern-here~n"),
	io:format("-------------- And so on up to five different folders ------------------~n"),
	io:format("-------------OPS: All folder paths must be paths to folders.------------~n").

check_folder(Dirs) ->
	lists:map(fun(Dir) -> filelib:is_dir(Dir) end, Dirs).

check_results(Results) ->
	lists:foreach(fun (Result) -> validate_directory(Result) end, Results).

validate_directory(Boolean) when Boolean == true ->
	ok;
validate_directory(Boolean) when Boolean == false ->
	exit(some_folder_argument_is_not_a_directory).

recursive_find_files(Folder,Regex) ->
	% transform the second parameter of io:format into a list so we have it all logged out
	io:format("~p~n", [filelib:fold_files(Folder, Regex, true, fun(File, Acc) ->
		% below we have two different tokens because we specifically target the list elements
		io:format("File ~p: ~s~n", [Acc, File]),
		Acc + 1
	end, 1)]).

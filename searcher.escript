#!/usr/bin/env escript

main(Args) ->
	case Args of
		[Folder,Regex] -> 
			io:format("Args ~p~n",[Args]),
			recursive_find_files(Folder, Regex);
		[Folder, SecondFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder],
			tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(tupelize, Folders),
			lists:map(recursive_find_files, FoldersWithRegex);
		[Folder, SecondFolder, ThirdFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder, ThirdFolder],
			tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(tupelize, Folders),
			lists:map(recursive_find_files, FoldersWithRegex);
		[Folder, SecondFolder,  ThirdFolder, FourthFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder,  ThirdFolder, FourthFolder],
			tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(tupelize, Folders),
			lists:map(recursive_find_files, FoldersWithRegex);
		[Folder, SecondFolder, ThirdFolder, FourthFolder, FifthFolder, Regex] -> 
			io:format("Args ~p~n",[Args]),
			Folders = [Folder, SecondFolder, ThirdFolder, FourthFolder, FifthFolder],
			tupelize = fun(X) -> {X, Regex} end,
			FoldersWithRegex = lists:map(tupelize, Folders),
			lists:map(recursive_find_files, FoldersWithRegex);
		_ ->
			usage()
	end;
main(_) ->
	usage().

usage() -> 
	io:format("-------------------------------Usage------------------------------------~n"),
	io:format("$ ./searcher.escript /path/to/folder1 <regex>~n"),
	io:format("--- If you want to search in two folders simultenously, do the below ---~n"),
	io:format("$ ./searcher.escript /path/to/folder1 /path/to/folder2 regex-pattern-here~n"),
	io:format("--- And so on up to five different folders ---~n").

recursive_find_files(Folder,Regex) ->
	% transform the second parameter of io:format into a list so we have it all logged out
	io:format("~p~n", [filelib:fold_files(Folder, Regex, true, fun(File, Acc) ->
		% below we have two different tokens because we specifically target the list elements
		io:format("File ~p: ~s~n", [Acc, File]),
		Acc + 1
	end, 1)]).

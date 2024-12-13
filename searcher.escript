#!/usr/bin/env escript

main(Args) ->
	case Args of
		[Folder,Regex] -> 
			io:format("Args ~p~n",[Args]),
			recursive_find_files(Folder, Regex)
	end;
main(_) ->
	usage().

usage() -> 
	io:format("Usage: ./searcher.escript /absolute/path/to/folder regex-pattern-here").

recursive_find_files(Folder,Regex) ->
	% transform the second parameter of io:format into a list so we have it all logged out
	io:format("~p~n", [filelib:fold_files(Folder, Regex, true, fun(File, Acc) ->
		% below we have two different tokens because we specifically target the list elements
		io:format("File ~p: ~s~n", [Acc, File]),
		Acc + 1
	end, 1)]).

#!/usr/bin/env escript

main(Args) ->
	case Args of
		[Folder,Regex] -> 
			io:format("Args ~p~n",[Args])
	end;
main(_) ->
	usage().

usage() -> 
	io:format("Usage: ./searcher.escript /absolute/path/to/folder regex-pattern-here").
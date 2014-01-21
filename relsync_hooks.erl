-module(relsync_hooks).

-export([presync/0, postsync/0]).

presync() ->
    io:format("Handling presync~n"),

    % Mount read-write so that we can update files
    mount:remount("/", [rw]).

postsync() ->
    io:format("Handling postsync~n"),

    % Remount as read-only so that the system
    % is like it normally is.
    mount:remount("/", [ro]).

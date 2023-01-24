% hello world program
-module(speak).

%API
-export([say/2, run/0]).

say(_, 0) ->
  done;
say(What, Times) ->
  io:fwrite(What ++ "\n"),
  say(What, Times-1).

run() ->
  spawn(main, say, ["Hi", 3]),
  spawn(main, say, ["Bye", 3]).

% hello world program
-module(talk).

%API
-export([alice/0, bob/2, run/0]).

alice() ->
  receive
    {message, PId} ->
      io:fwrite("Alice got a message\n"),
      PId ! message,
      alice();
  finished -> io:frwite("Alice is finished\n")
end.

bob(0, PId) ->
  PId ! finished,
  io:fwrite("Bob is finished\n");
bob(N, PId) ->
  PId ! {message, self()},
  receive
    message -> io:fwrite("Bob got a message\n")
  end,
  bob(N-1, PId).


run() ->
  PId = spawn(talk, alice, []),
  spawn(talk, bob, [3, PId]).

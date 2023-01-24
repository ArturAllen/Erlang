% hello world program
-module(talk).

%API
-export([alice/0, bob/1, run/0]).

alice() ->
  receive
    message ->
      io:fwrite("Alice got a message\n"),
      bob ! message,
      alice();
  finished -> io:frwite("Alice is finished\n")
end.

bob(0) ->
  alice ! finished,
  io:fwrite("Bob is finished\n");
bob(N) ->
  alice ! message,
  receive
    message -> io:fwrite("Bob got a message\n")
  end,
  bob(N-1).

run() ->
  register(alice, spawn(talk2, alice, [])),
  register(bob, spawn(talk2, bob, [3])).

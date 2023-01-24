% hello world program
-module(talk).

%API
-export([alice/0, bob/2, startAlice/0, startBob/0, run/0]).

alice() ->
  receive
    {message, BobNode} ->
      io:fwrite("Alice got a message\n"),
      BobNode ! message,
      alice();
  finished -> io:frwite("Alice is finished\n")
end.

bob(0, AliceNode) ->
  {alice, AliceNode} ! finished,
  io:fwrite("Bob is finished\n");
bob(N, AliceNode) ->
  {alice, AliceNode) ! {message, self()},
  receive
    message -> io:fwrite("Bob got a message\n")
  end,
  bob(N-1, AliceNode).

run() ->
  register(alice, spawn(talk2, alice, [])),
  register(bob, spawn(talk2, bob, [3])).

startAlice() ->
  register(alice, spawn(talk3, alice, [])).
 
startBob(AliceNode) ->
  spawn(talk3, bob, [3]))

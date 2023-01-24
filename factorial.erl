% hello world program
-module(factorial).

%API
-export([factorial/0]).

factorial(1) ->
    1;
factorial(N) ->
    N * factorial(N-1).

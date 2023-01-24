% hello world program
-module(hof).

%API
-export([map/2]).

double() -> 
  F = fun(X) -> 2 * X end,
  map(F, [1,5,2,7,4,6]).

map(_, []) -> [];
map(F, [First | Rest]) ->
  [F(First) | map(F, Rest)].

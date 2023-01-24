% hello world program
-module(age).

%API
-export([getAge/1]).

getAge(Name) ->
  AgeMap = #{"Alice" => 23, "Bob" => 25, "Carol" => 29}, % This is a Map
  maps:get(Name, AgeMap, -1).



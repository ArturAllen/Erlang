% hello world program
-module(ageGroup).

%API
-export([getAgeGroup/1]).

getAgeGroup(N) when N < 13 ->
  child;
getAgeGroup(N) when N < 18 ->
  teen;
getAgeGroup(N) when N > 17 ->
  adult.

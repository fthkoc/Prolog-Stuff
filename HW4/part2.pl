%% CSE341 HW4 - Fatih Koç - 141044013
%% Part 2

%% knowledge base
distance(istanbul, antalya, 481).
distance(istanbul, izmir, 328).
distance(istanbul, ankara, 351).
distance(istanbul, gaziantep, 847).
distance(istanbul, van, 1262).
distance(istanbul, rize, 967).
distance(edirne, edremit, 251).
distance(edremit, erzincan, 992).
distance(izmir, isparta, 308).
distance(isparta, burdur, 24).
distance(antalya, gaziantep, 592).
distance(antalya, konya, 192).
distance(konya, ankara, 227).
distance(ankara, van, 920).
distance(rize, van, 373).

%% rules
link(X, Y, Distance):- 
	distance(X, Y, Distance).
link(X, Y, Distance):- 
	distance(Y, X, Distance).

% returns member, taken from the internet
get_member(X, [Head|Tail]) :- 
	X = Head; 
	get_member(X, Tail).

sroute(X, Y, Distance):- 
	path_check(X, Y, Distance, [X]).

path_check(X, Y, Distance, Cities):- 
	link(X, Y, Distance), 
	not(get_member(Y, Cities)).
path_check(X, Y, Distance, Cities) :-
	link(X, Z, CurrentDistance),
	not(get_member(Z, Cities)),
	append([Z], Cities, UpdatedCities),
	path_check(Z, Y, NextDistance, UpdatedCities)
	Distance is CurrentDistance + NextDistance.

%% CSE341 HW4 - Fatih Koç - 141044013
%% Part 1

%% knowledge base
flight(istanbul, antalya).
flight(istanbul, izmir).
flight(istanbul, ankara).
flight(istanbul, gaziantep).
flight(istanbul, van).
flight(istanbul, rize).
flight(edirne, edremit).
flight(edremit, erzincan).
flight(izmir, isparta).
flight(isparta, burdur).
flight(antalya, gaziantep).
flight(antalya, konya).
flight(konya, ankara).
flight(ankara, van).
flight(rize, van).

%% rules
link(X, Y):- 
	flight(X, Y).
link(X, Y):- 
	flight(Y, X).

% returns member, taken from the internet
get_member(X, [Head|Tail]) :- 
	X = Head; 
	get_member(X, Tail).

route(X, Y):- 
	path_check(X, Y, [X]).

path_check(X, Y, Cities):- 
	link(X, Y), 
	not(get_member(Y, Cities)).
path_check(X, Y, Cities) :-
	link(X, Z),
	not(get_member(Z, Cities)),
	append([Z], Cities, UpdatedCities),
	path_check(Z, Y, UpdatedCities).
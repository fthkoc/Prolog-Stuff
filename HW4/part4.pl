%% CSE341 HW4 - Fatih Koç - 141044013
%% Part 4

%% 4.1
%% element implementation
element(E, [E|CDR]).
element(E, [CADR|CDR]) :- element(E, CDR).

%% element implementation with built-in functions.
element2(E, S) :- member(E, S).


%% 4.2
%% union implementation
union([], [], []).
union(S1, [], S1).
union([], S2, S2).
union([CAR1|CDR1], S2, S3) :- 
	element(CAR1, S2), 
	!, 
	union(CDR1, S2, S3).
union([CAR1|CDR1], S2, [CAR1|S3]) :- 
	union(CDR1, S2, S3).

%% union implementation with built-in functions
union2(S1, S2, S3) :- 
	union(S1, S2, S3).


%% 4.3
%% intersection implementation
intersect([], _, []).
intersect(_, [], []).
intersect([CAR1|CDR1], S2, RESULT) :- 
	element(CAR1, S2), 
	!, 
	RESULT = [CAR1|S3], 
	intersect(CDR1, S2, S3).
intersect([_|CDR1], S2, S3) :- 
	intersect(CDR1, S2, S3).

%% intersection implementation with built-in functions
intersect2(S1, S2, S3) :- intersection(S1, S2, S3).

%% 4.4
%% equivalent implementation with recursion
equivalent(S1, S2) :- intersect(S1, S2, S1), intersect(S1, S2, S2).

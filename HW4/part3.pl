%% CSE341 HW4 - Fatih Koç - 141044013
%% Part 3

%% knowledge base
class(102, 10, z23).
class(108, 12, z11).
class(341, 14, z06).
class(455, 16, 207).
class(452, 17, 207).

enrollment(a, 102).
enrollment(a, 108).
enrollment(b, 102).
enrollment(c, 108).
enrollment(d, 341).
enrollment(e, 455).


%% rules
when(Course, Time) :- 
	class(Course, Time, Room).
where(Course, Room) :- 
	class(Course, Time, Room).
enroll(Student, Course) :- 
	enrollment(Student, Course).


%% 3.1
schedule(Student, Room, Time) :- 
	enrollment(Student, X), class(X, Time, Room).

schedule2(Student, Course, Time) :- 
	enrollment(Student, Course), class(Course, Time, Room).


%% 3.2
usage(Room, Time) :- 
	class(X, Time, Room).

usage2(Room, Course) :- 
	class(Course, Time, Room).


%% 3.3
conflict(X, Y) :- 
	class(X, Time, K), class(Y, Time, L).
conflict(X, Y) :- 
	class(X, K, Room), class(Y, L, Room).

conflict2(X, Y) :- 
	class(X, Time, Room), class(Y, Time, Room).


%% 3.4
meet(X, Y) :-
	enrollment(X, Course), enrollment(Y, Course).

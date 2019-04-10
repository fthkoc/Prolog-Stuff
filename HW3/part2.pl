% 141044013 - Fatih Koç - CSE341, HW3, Part2
% Example Run: route(istanbul, X, Y)
% Example Run: route(istanbul, izmir,, Y)

% knowledge base
flight(istanbul,izmir,3). % Istanbul and Izmir has a flight with cost 3.
flight(izmir,istanbul,3). % To represent two-way relation between cities.
flight(istanbul,trabzon,3).
flight(trabzon,istanbul,3).
flight(istanbul,ankara,2).
flight(ankara,istanbul,2).
flight(ankara,trabzon,6).
flight(trabzon,ankara,6).
flight(ankara,kars,3).
flight(kars,ankara,3).
flight(ankara,diyarbakir,8).
flight(diyarbakir,ankara,8).
flight(ankara,izmir,6).
flight(izmir,ankara,6).
flight(kars,gaziantep,3).
flight(gaziantep,kars,3).
flight(antalya,izmir,1).
flight(izmir,antalya,1).
flight(antalya,erzurum,2).
flight(erzurum,antalya,2).
flight(edirne,erzurum,5).
flight(erzurum,edirne,5).

% rules
%a predicate indicating there exist a route between SourceCity and TargetCity if there is flight between SourceCity and TargetCity with cost Cost.
directlyConnected(SourceCity,TargetCity,Cost) :- flight(SourceCity,TargetCity,Cost).

route(SourceCity,TargetCity,Cost) :- alternativePaths(SourceCity,TargetCity,Cost,[SourceCity]).

alternativePaths(SourceCity,TargetCity,Cost,LIST):- directlyConnected(SourceCity,TargetCity,Cost) , not(member(TargetCity,LIST)).
alternativePaths(SourceCity, TargetCity, Cost, LIST) :- directlyConnected(SourceCity,Interchange,Cost1) , not(member(Interchange,LIST)) , append([Interchange],LIST,LIST2) , alternativePaths(Interchange,TargetCity,Cost2,LIST2) , Cost is Cost1 + Cost2.
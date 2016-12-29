%membership testing  (is an element of a list)
% ?- member1(2, [1,2,3]).
% ?- true
member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T).

%first element 
%?- firstelement([1,2,5,6,1], X).
%X = 1.
firstelement([X|_], X).

%last element 
%?- lastelement([a,b,c,d,e], X).
%X = e.
lastelement([X], X).
lastelement([_|T], X) :- lastelement(T,X).

%two adjacent elements
%?- adjacent(X,Y,[1,2,3,4,5]).
%X = 1,
%Y = 2 ;
%X = 2,
%Y = 3 ;
%X = 3,
%Y = 4 ;
%X = 4,
%Y = 5 ;
adjacent(X,Y,[X,Y|_]).
adjacent(X,Y,[_|T]) :- adjacent(X,Y,T).

%three adjacent elements
%?- adjacent(X,Y,[1,2,3,4,5]).
%X = 1,
%Y = 2 ;
%X = 2,
%Y = 3 ;
%X = 3,
%Y = 4 ;
%X = 4,
%Y = 5 ;
%false.
adjacent(X,Y,Z,[X,Y,Z|_]).
adjacent(X,Y,Z,[_|T]) :-adjacent(X,Y,Z,T).

%append list1 to list 2 
%?- append1([3, 2], [4,7], L).
%L = [3, 2, 4, 7].

append1([], L2, L2). %appending empty list gives unchanged list
append1([X|T1], L2, [X|T3]):-append1(T1,L2,T3). %appending L1 head, L1 tail + L2

%delete element from a list
%?- delete1(2, [1,2,3], L).
%L = [1, 3] 
delete1(X, [X|T], T).
delete1(X, [H|T], [H|T1]) :- delete1(X, T, T1).

%append element to a list
%?- append2([a,b,c], d, L).
%L = [a, b, c, d].
append2([], X, [X]).
append2([H|T], X, [H|T1]) :- append1(T,X,T1).

%insert element into a list 
%?- delete1(2, [1,2,3], L).
%?- insert(2, L, [1,2,3].
%?- insert(3, [1,2,3], L).
%L = [3, 1, 2, 3] ;
%L = [1, 3, 2, 3] ;
%L = [1, 2, 3, 3] ;
%L = [1, 2, 3, 3] ;
%false.
insert(X, L, XL) :- delete1(X, XL, L).

%find the length of a list
%?- length1([7,4,6,2], LengthSize).
%LengthSize = 4.
length1([],0).
length1([_|T], N) :- length(T,ADD), N is ADD+1.

%reverse a list 
%?- reversed([a,b,c,d], R).
%?- R = [d, c, b, a].
reversed([],[]).
reversed([H|T], Rev) :- reversed(T, ReversedTail), 
			append1(ReversedTail, [H], Rev).

%check if list is palindrome
%?- palindrome([X,Y,Z], PalindromeList).
%PalindromeList = [Z, Y, X].
palindrome([],[]).
palindrome([H|T], ReversedList) :- reversed([H|T], ReversedList).

%display a list
%?- displayList([a,b,c]).
%a b c 
%false.
displayList([]):- n1.
displayList([H|T]) :- write(H), tab(1), displayList(T).

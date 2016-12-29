%Declaration of all the males and families 
m([kendrick, george, joseph, chun, randell, tom, josephBrother, laurence, molita, who, randellsBrother, hisStepBrother, myStepBrother]).
f([eileen, kimberly, cassie, chunli, carmen, hannah, herStepSister, myStepSister]).
family([joseph, eileen, [kendrick, kimberly, cassie]]).
family([chun, chunli, [joseph, dicky, carmen]]).
family([tom, carmen, [hannah]]).
family([who, laurence, [randell, randellsBrother, chun]]).
family([joseph, pamela,[hisStepBrother, herStepSister, myStepBrother, myStepSister]]). 

%X is a family member of the list
familyMember(X, [X|_]).
familyMember(X,[_|T]) :- familyMember(X, T).

%define males and define who is the fathers, mothers, and parents 
male(X) :- m(List), familyMember(X, List).
%?- male(X).
%X = kendrick ;
%X = george ;
%X = joseph ;
%X = chun ;
%X = randell ;
%X = tom ;
%X = josephBrother ;
%X = laurence ;
%X = molita ;
%X = who ;
%X = randellsBrother ;
%X = hisStepBrother ;
%X = myStepBrother ;
%false.


female(X) :- f(List), familyMember(X, List).
%?- female(X).
%X = eileen ;
%X = kimberly ;
%X = cassie ;
%X = chunli ;
%X = carmen ;
%X = hannah ;
%X = herStepSister ;
%X = myStepSister ;
%false.

father(FA, C) :- family([FA,_|List]), familyMember(Y,List), familyMember(C,Y). 
%?- father(joseph, X).
%X = kendrick ;
%X = kimberly ;
%X = cassie ;
%X = hisStepBrother ;
%X = herStepSister ;
%X = myStepBrother ;
%X = myStepSister ;
%false.

mother(MO, C) :- family([_,MO|List]), familyMember(Y,List), familyMember(C,Y). 
%?- mother(eileen, X).
%X = kendrick ;
%X = kimberly ;
%X = cassie ;
%false.

parent(P, C) :- family([P,_|List]), familyMember(Y,List), familyMember(C,Y); 
		family([_,P|List]), familyMember(Y,List), familyMember(C,Y).
%?- parent(P, kendrick).
%P = joseph ;
%P = eileen ;
%false.

siblings1(X, Y) :- parent(P1, X), parent(P1, Y), parent(P2, X), parent(P3, Y), X\=Y,
P1\=P2, P2\=P3, P1\=P3.
%?- siblings1(X, kendrick).
%X = hisStepBrother ;
%X = herStepSister ;
%X = myStepBrother ;
%X = myStepSister ;
%false.

siblings2(X,Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), X\=Y. 
%?- siblings2(X, kendrick).
%X = kimberly ;
%X = cassie ;
%false.

brother1(X,Y) :- siblings1(X,Y), male(X), X\=Y.
%?- brother1(X, kimberly).
%X = hisStepBrother ;
%X = myStepBrother ;
%false.

brother2(X,Y) :- siblings2(X,Y), male(X), X\=Y.
%?- brother2(X, kimberly).
%X = kendrick ;
%false.

sister1(X,Y) :- siblings1(X,Y), female(X), X\=Y.
%?- sister1(X, kimberly).
%X = herStepSister ;
%X = myStepSister ;
%false.

sister2(X,Y) :- siblings2(X,Y), female(X), X\=Y.
%?- sister2(X, kimberly).
%X = cassie ;
%false.

aunt(X,Y) :- parent(Z,Y), sister2(X,Z), X\=Y.
%?- aunt(carmen, X).
%X = kendrick ;
%X = kimberly ;
%X = cassie ;
%X = hisStepBrother ;
%X = herStepSister ;
%X = myStepBrother ;
%X = myStepSister ;
%false.


uncle(X,Y) :- parent(Z,Y), brother2(X,Z), X\=Y.
%?- uncle(randell, X).
%X = joseph ;
%X = dicky ;
%X = carmen ;
%false.

grandchild(X,Y) :- parent(Y,Z), parent(Z,X), X\=Y.
%?- grandchild(X, chun).
%X = kendrick ;
%X = kimberly ;
%X = cassie ;
%X = hisStepBrother ;
%X = herStepSister ;
%X = myStepBrother ;
%X = myStepSister ;
%X = hannah ;
%false.


grandson(X,Y) :- parent(Y,Z), parent(Z,X), male(X), X\=Y.
%?- grandson(X, chun).
%X = kendrick ;
%X = kendrick ;
%X = hisStepBrother ;
%X = myStepBrother ;
%false.

granddaughter(X,Y) :- parent(Y,Z), parent(Z,X), female(X), X\=Y.
%X = kimberly ;
%X = cassie ;
%X = herStepSister ;
%X = myStepSister ;
%X = hannah ;
%false.

grandparent(X,Y) :- parent(X, Z), parent(Z, Y), X\=Y.
%?- grandparent(X, kendrick).
%X = chun ;
%X = chunli ;
%false.

greatgrandparent(X,Y) :- grandparent(X, A), parent(A, Y), X\=Y.
%?- greatgrandparent(X, kendrick).
%X = who ;
%X = laurence ;
%false.

ancestor(Person, Ancestor) :- parent(Ancestor, Person).
ancestor(Person, Ancestor) :- parent(Parent, Person), ancestor(Parent, Ancestor). 
%?- ancestor(kendrick, X).
%X = joseph ;
%X = eileen ;
%X = chun ;
%X = chunli ;
%X = who ;
%X = laurence ;
%false.


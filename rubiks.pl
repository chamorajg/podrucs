% move is used to represent the moves of the cube and changes in a single dimension of the cube. 
% 1 - used to move the first four tiles, 2 - used to move the second four tiles, 3 - used to move the third four tiles.
% The sides are only on the front side of the cube so no representation of the other sides are required. 
cube(X1, X2, X3, X4, X5, X6).
%cube(1,2,3,4,5,6).
move(1, cube(X1, X2, X3, X4, X5, X6), cube(X4, X3, X2, X1, X5, X6)) :-
	write(cube(X4, X3, X2, X1, X5, X6)), nl.

move(2, cube(X1, X2, X3, X4, X5, X6), cube(X1, X5, X4, X3, X2, X6)) :-
	write(cube(X1, X5, X4, X3, X2, X6)), nl.

move(3, cube(X1, X2, X3, X4, X5, X6), cube(X1, X2, X6, X5, X4, X3)) :-
	write(cube(X1, X2, X6, X5, X4, X3)), nl.

/*
get_dist([], [], N) :- 
	write(N), nl.

get_dist([H1 | T1], [H2 | T2], N) :-
	%write([H1], [H2]), nl, write([T1], [T2]), nl,
	H1 == H2 -> get_dist(T1, T2, 0); 
	H1 =:= H2 -> get_dist(T1, T2, 1).

get_move(C, cube(X1, X2, X3, X4, X5, X6)) :-
	move(1, cube(X1, X2, X3, X4, X5, X6), cube(L, M, N, P, Q, R)),
	get_dist([L, M, N, P, Q, R], [1, 2, 3, 4, 5, 6], C_1),
	move(2, cube(X1, X2, X3, X4, X5, X6), cube(L, M, N, P, Q, R)),
	get_dist([L, M, N, P, Q, R], [1, 2, 3, 4, 5, 6], C_2),
	move(3, cube(X1, X2, X3, X4, X5, X6), cube(L, M, N, P, Q, R)),
	get_dist([L, M, N, P, Q, R], [1, 2, 3, 4, 5, 6], C_3),
	C_1 >= C2, C_1 >= C3, C = C_1; C_2 >= C_1, C_2 >= C_3, C = C_2; C_3 >= C_1, C_3 >= C_2, C = C_3. */

isEqual(cube(X1, X2, X3, X4, X5, X6), cube(A1, A2, A3, A4, A5, A6)):-
	cube(X1, X2, X3, X4, X5, X6) == cube(A1, A2, A3, A4, A5, A6).

check(cube(X1, X2, X3, X4, X5, X6)) :-
	isEqual(cube(X1, X2, X3, X4, X5, X6), cube(1,2,3,4,5,6)).

output(cube(X1, X2, X3, X4, X5, X6)) :-
	write(cube(X1, X2, X3, X4, X4, X6)), nl.

play(1, 2, 3, 4, 5, 6) :-
	write(cube(1, 2, 3, 4, 5, 6)), nl.

play(A, B, C, D, E, F) :-
	random(1, 4, X),
	write(get_move(X, cube(A, B, C, D, E, F)), nl,
	move(X, cube(A, B, C, D, E, F), cube(L, M, N, P, Q, R)),
	play(L, M, N, P, Q, R).
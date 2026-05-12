/* Initial beliefs and rules */
// only base cases, not the recursive rule
fib(0, 1).
fib(1, 1).

/* Initial goals */
!compute_fibonacci_until(0, 100).
//!print_stuff(0, 100).

/* Plans */
+!compute_fibonacci_until(N, N) <- 
    !compute_fibonacci(N);
    .print("Done") .

+!compute_fibonacci_until(N, M) : N < M <- 
    !compute_fibonacci(N);
    !compute_fibonacci_until(N + 1, M).
    
+!compute_fibonacci(N) <-
    ?fib(N, Y);
    .print("fib(", N, ") = ", Y).

/* Test goals with a plan mean act on the environment to obtain the knowledge */

/* Compute the Fibonacci number using the belief base */
+?fib(X, Y) : fib(X - 1, Y1) &  fib(X - 2, Y2) & Y = Y1 + Y2 <-
    +fib(X, Y).

/* Failed to compute the Fibonacci number using the belief base, so we need to compute it using the recursive rule */
-?fib(X, Y) <- 
    ?fib(X - 2, _);
    ?fib(X - 1, _);
    ?fib(X, Y).
    
//+!print_stuff(N, M) <-
//	.print("stuff");
//	if (N < M) {
//		!print_stuff(N + 1, M)
//	}.

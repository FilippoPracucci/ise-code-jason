/* Initial beliefs and rules */

/* Initial goals */
!count_from_to(0, 10).

/* Plans */

/* Omitted the ': true' guard */
+!count_from_to(N, N) <-
    .print("hello world ", N).

+!count_from_to(N, M) : N < M <- 
    .print("hello world ", N);
    !count_from_to(N + 1, M).


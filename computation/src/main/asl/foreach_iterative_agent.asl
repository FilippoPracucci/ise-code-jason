/* Initial beliefs and rules */
// Peano numbers
nat(z). // fact
nat(s(X)) :- nat(X). // rule: s(X) is a natural number if X is a natural number

// nat(1).
// nat(2).
// nat(3).

/* Initial goals */
!start.

/* Plans */
+!start <-
    // this only works in jason 2.5+
    /* for all possibile solution of the condition */
    for(nat(X)) {
        .print("value ", X);
        .wait(1000);
    }.

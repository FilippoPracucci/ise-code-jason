/* Initial beliefs and rules */
count(0).

/* Initial goals */
!start.

/* Plans */
+!start <-
    /* condition about agent beliefs */
    while(count(X) & X >= 0) { // is there an X for which count(X) is a belief and X is greater than or equal to 0? 
        .print("value ", X);
        .wait(1000);
        -+count(X + 1)
    }.
    /* -count removes the belief count(X) and +count(X + 1) adds the belief count(X + 1).
        To make an atomic update shoulduse -+count(X + 1),
        otherwise in a MAS another agent could read the belief count(X) in the middle of the update and get an inconsistent state.
    */

/* Plan triggered at the addition of the count(17) belief */
+count(17) <-
    .print("Count reached 17").

count_extracted(0).

!bingo.

+!bingo : count_extracted(90) <- .print("Bingo is over").

+!bingo : count_extracted(N) & N < 90 <-
    ?extract_new(X);
    +extracted(X); // update belief base with the newly extracted number
    -+count_extracted(N + 1); // update belief base incrementing the count of extracted numbers
    .print(X);
    !!bingo.

/* Test goal: extract a new number and check if it's already been extracted */
+?extract_new(X) <-
    .wait(1000);
    utils.rand_int(X, 1, 90); // side effect: X is assigned a random integer between 1 and 90
    ?not(extracted(X)). // Test goal without a test plan, so it will test against the belief base. 

-?extract_new(X) <- ?extract_new(X).
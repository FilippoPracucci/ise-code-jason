/* Initial beliefs and rules */

// belief(...).

/* Initial goals (sort of entry point, so functions called in a main) */

!greet_the_user. // Symbol as prefix respect to a belief.

/* Plans (sort of functions) */

/* Whenever there is a new event all the agents with !greet_the_user as goal will execute this plan,
if the guard is true (: true in this case) */
/* Head [: guard] <- body. */
+!greet_the_user : true <- 
	.print("hello world").
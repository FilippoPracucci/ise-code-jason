/* The temperature is updated continuously (implicit BDI control loop that triggers +temperature(X)), so one reaction is always triggered */

target(20). // target temperature

/* Only plans, no initial goals */

/* Regulate the temperature when there is a change in the temperature */
+temperature(X) <- !regulate_temperature(X).

+!regulate_temperature(X) : target(Y) & X - Y > 0.5 <-
    .print("Temperature is ", X, ": need to cool down");
    spray_air(cold). // External action to decrease the temperature

+!regulate_temperature(X) : target(Y) & Y - X > 0.5 <-
    .print("Temperature is ", X, ": need to warm up");
    spray_air(hot). // External action to increase the temperature

+!regulate_temperature(X) : target(Y) & Z = X - Y & Z >= -0.5 & Z <= 0.5 <-
    .print("Temperature is ", X, ": it's ok.").

/* Failure handling plan: if the action fails, retry */
-!regulate_temperature(X) <-
    .print("Failed to spray air. Retrying.");
    !regulate_temperature(X).



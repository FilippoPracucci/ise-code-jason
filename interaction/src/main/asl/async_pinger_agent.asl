/* Initial beliefs and rules */

/* Implicitly annotated with source(self) */
turn(me).
other(pong).

/* Initial goals */

!send_ping.

/* Plans */

+!send_ping : turn(me) & other(Receiver) <-
  -+turn(other);
  !sendMessageTo(ball, Receiver).

/* event of a belief's addition
  [source(Sender)] is an annotation*/
+ball[source(Sender)] : turn(other) & other(Sender) <- // condition hold when Sender == pong
  -+turn(me);
  -ball[source(Sender)]; // remove the belief after processing (if omitted the agent memory will be filled quickly)
  .print("Received ball from ", Sender);
  .print("Done").

+!sendMessageTo(Message, Receiver) <-
  .print("Sending ", Message, " to ", Receiver);
  .send(Receiver, tell, Message).

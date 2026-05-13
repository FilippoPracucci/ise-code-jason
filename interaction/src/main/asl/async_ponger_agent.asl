/* Initial beliefs and rules */

turn(other).
other(ping).

/* Plans */

+ball[source(Sender)] :turn(other) & other(Sender) <-
  -+turn(self);
  -ball[source(Sender)];
  .print("Received ball from ", Sender);
  !sendMessageTo(ball, Sender);
  .print("Done").

+!sendMessageTo(Message, Receiver) <-
  .print("Sending ", Message, " to ", Receiver);
  .send(Receiver, tell, Message).


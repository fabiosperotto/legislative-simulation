// Agent congressman in project simulalei

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+vote_proposal(D, Par, S, R)[source(A)]: true <-
	.term2string(N, math.random * 1 + 0);
//	.print("I vote ", N);
	.send(A, tell, polling(D, Par, S, R, N)).
	

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

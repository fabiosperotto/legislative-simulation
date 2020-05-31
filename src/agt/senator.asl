// Agent senator in project simulalei

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+vote_proposal_in_senate(D, Par, S, A, R)[source(O)]: true <-
	.term2string(N, math.random * 1 + 0);
	.send(O, tell, polling_senate(D, Par, S, A, R, N)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

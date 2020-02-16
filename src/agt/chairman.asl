// Agent chairman in project simulalei

/* Initial beliefs and rules */

/* Initial goals */



/* Plans */

+proposal(D, S) : true <-
	.print("An proposal is ready");
	.send(deputies_president, tell, proposal_approved(D, S)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

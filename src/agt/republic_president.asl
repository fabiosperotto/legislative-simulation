// Agent republic_president in project simulalei

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+law_approved_senate(D, S) : true <- 
	.print("My attention is needed, a law was approved on senate").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

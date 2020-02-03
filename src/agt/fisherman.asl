// Agent sample_agent in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!start.
/* Plans */
+!start : true <- 
	.print("Amateur fisherman online").
	//above is another option with
	//internal action agent to communicate
	//with legal ontology
	//eval.action("fish", A);
	//+stateSanction(A).
	
+legislation: true <-
	checkAction("fish").
//	.my_name(N);
//	.print("meu nome é ",N).
	

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

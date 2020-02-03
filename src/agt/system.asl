// Agent system in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

//system agent code
!observe.
/* Plans */
+!observe : true <-
	?existsLaw(L).
	
+?existsLaw(LegId): true <-
	lookupArtifact(legislation, LegId);
	focus(LegId);
	println("I found a legislation").
	
-?existsLaw(LegId): true <-
	.wait(10);
	?existsLaw(LegId).
	
+legal(Concept, Value) : true <-
	println("I received a communication about a sanction of type => ", Concept, " with value = ", Value);
	+sanction(Value);
	.perceive.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

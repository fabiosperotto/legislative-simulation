// Agent governo in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

//government agent code
!start.
/* Plans */
+!start : true <- 
	.println("Government making laws!");
	makeArtifact(legislation, "simulalei.Legislation", [], Legislation);
	focus(Legislation);
	.broadcast(tell, legislation).
	
+violacao: true <-
	.println("recebi violacao").
	
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

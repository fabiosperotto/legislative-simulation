// Agent governo in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	.println("governo fazendo as leis.");
	makeArtifact("legislacao", "simulalei.Legislacao", [], Legislacao);
	focus(Legislacao);
	.broadcast(tell, legislacao).
	
+violacao: true <-
	.println("recebi violacao").
	
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

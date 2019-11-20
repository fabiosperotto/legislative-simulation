// Agent sistema in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!observe.

/* Plans */

+!observe : true <-
	?existeLegislacao(L).
	
+?existeLegislacao(LegId): true <-
	lookupArtifact("legislacao", LegId);
	focus(LegId);
	println("Achei legislação").
	
-?existeLegislacao(LegId): true <-
	.wait(10);
	?existeLegislacao(LegId).
	
+legal(Conceito, Valor) : true <-
	println("Recebi uma comunicação sobre sanção do tipo = ", Conceito, " e de valor = ", Valor);
	+sancao(Valor);
	.perceive.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

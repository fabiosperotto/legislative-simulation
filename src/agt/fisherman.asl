// Agent sample_agent in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!start.


/* Plans */


	
+!start : true <- 
	.print("Pescador online");
	//abaixo segue forma de utilizar internal action para 
	//o agente se comunicar diretamente com a ontologia
	eval.action("fish", A);
	+devendoEstado(A).
	
+legislacao: true <-
	checkAction("fish").
//	.my_name(N);
//	.print("meu nome é ",N).
	

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

// Agent republic_president in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <-
	makeArtifact("publication", "congress.Publication", [], PublicationID);
	lookupArtifact("publication", Publication);
	focus(Publication).

+law_approved_senate(D, Par, S, A, R) : true <- 
	.print("My attention is needed, a law was approved on senate");
	newLaw(D, Par, S, A, R)[artifact_name("publication")]. //here the agent will create the law in ontology through middleware

+law_published(N, D, Par, S, A, R) : true <-
	.print("I approve and sign this new law");
	.broadcast(tell, law_published(N, D, Par, S, A, R)).
	
+law_publishing_error(N, D, Par, S, A, R) : true <-
	.print("Something is wrong with this law '",D,"' and I cannot approve").
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

// Agent comptroller in project simulalei
//This is a relator or comptroller of a committee about a specific legislations studies in chamber of deputies

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	.print("Researching about law proposal: 'Cause a fire in the woods or forest'");
	chamber.research("Cause a fire in the woods or forest", "allRoles", P);
	!send_proposal(P, "Cause a fire in the woods or forest", "Confinement>min_jail=2;max_jail=4@PayAFine>pay-a-fine=500").
	
	
+!send_proposal(P, D, S) : P = "no" <-
		.print("Proposal that does not exist in current legislation: ", D);
		.send(committee_chairman, tell, proposal(D, S)).


+!send_proposal(P, D) : P \== "no" <-
		.print("Proposal '",D,"' exist in current legislation").		

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

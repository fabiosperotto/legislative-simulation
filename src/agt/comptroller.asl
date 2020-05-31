// Agent comptroller in project simulalei
//This is a relator or comptroller of a committee about a specific legislations studies from chamber of deputies

/* Initial beliefs and rules */

/* Initial goals */

!start.

//!start_to_update.

/* Plans */

+!start : true <- 
	//the law model used in this example is extracted from law 9605, article 41: http://www.planalto.gov.br/ccivil_03/leis/l9605.htm
	.print("Researching about law proposal: 'Cause a fire in the woods or forest'");
	chamber.research("Cause a fire in the woods or forest", "allRoles", "firing", 
						"Confinement>detention-2_4@PayAFine>pay-a-fine-500", P, D, Norm, Consequences, 
						Action, Role);
	!send_proposal(P, D, Norm, Consequences, Action, Role).
	
	
+!send_proposal(P, D, Par, S, A, R) : P = "no" <-
		.print("Proposal that does not exist in current legislation: ", D);
		.send(committee_chairman, tell, proposal(D, Par, S, A, R)).


+!send_proposal(P, D, Par, S, A, R) : P \== "no" <-
		.print("Proposal '",D,"' exist in current legislation").
		
+!start_to_update : true <-
	chamber.research("Cause a fire in the woods or forest", "allRoles", "firing", P, D, Norm, Consequences, Action);
	.print("An proposal to update the law ", P, " with description: ", D);
	!send_proposal_update(P , "Another description", Norm, Consequences, A, "allRoles").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

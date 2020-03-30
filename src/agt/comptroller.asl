// Agent comptroller in project simulalei
//This is a relator or comptroller of a committee about a specific legislations studies from chamber of deputies

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	//the law model used in this example is extracted from law 9605, article 41: http://www.planalto.gov.br/ccivil_03/leis/l9605.htm
	.print("Researching about law proposal: 'Cause a fire in the woods or forest'");
	chamber.research("Cause a fire in the woods or forest", "allRoles", P, D, Norm, Consequences);
	!send_proposal(P , D, Norm, Consequences, "allRoles").
	
	
+!send_proposal(P, D, Par, S, R) : P = "no" <-
		.print("Proposal that does not exist in current legislation: ", D);
		.send(committee_chairman, tell, proposal(D, Par, S, R)).


+!send_proposal(P, D, Par, S, R) : P \== "no" <-
		.print("Proposal '",D,"' exist in current legislation");
		.print(Par);
		.print(S).		

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

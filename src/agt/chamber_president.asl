// Agent chamber_president in project simulalei
// The president of the chamber of deputies
/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	makeArtifact("voteBoard","congress.VoteBoard",[], VoteBoardID);
	lookupArtifact("voteBoard", VoteBoard);
	focus(VoteBoard).


+proposal_approved(D, S) : true <-
	.print("I received a new law proposal: ", D, " let's vote!");
	!voting_law(D, S).
	
+!voting_law(D, S): true <-
	.broadcast(tell, vote_proposal(D, S)).
	

+polling(D, S, V)[source(A)] : true <- 
	board(V, A, D, S)[artifact_name("voteBoard")].
	
	
+vote_ended(D, S) : law_approved(X) & X = "yes" <-
	.print("All voted, law is approved!");
	.send(committee_chairman, tell, law_approved(D,"yes"));
	.send(senator_president, tell, law_approved_chamber(D, S)).
	
	
+vote_ended(D, S) : law_approved(X) & X \== "yes" <-
	.print("All voted, law is not approved");
	.send(committee_chairman, tell, law_approved(D,"no")).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

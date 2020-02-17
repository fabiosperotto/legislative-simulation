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


+proposal_approved(D, Par, S, R) : true <-
	.print("I received a new law proposal: ", D, " let's vote!");
	!voting_law(D, Par, S, R).
	
+!voting_law(D, Par, S, R): true <-
	.broadcast(tell, vote_proposal(D, Par, S, R)). //this will start the election
	

+polling(D, Par, S, R, V)[source(A)] : true <- 
	board(V, A, D, Par, S, R)[artifact_name("voteBoard")]. //here the votes are computed
	
	
+vote_ended(D, Par, S, R) : law_approved(X) & X = "yes" <-
	.print("All voted, law is approved!");
	.send(committee_chairman, tell, law_approved(D,"yes"));
	.send(senator_president, tell, law_approved_chamber(D, Par, S, R)).
	
	
+vote_ended(D, Par, S, R) : law_approved(X) & X \== "yes" <-
	.print("All voted, law is not approved");
	.send(committee_chairman, tell, law_approved(D,"no")).
	
+law_published(N, D, Par, S, R) : true <-
	.print("I received the law", N, ". Thank you Mr./Mrs. President").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

// Agent senate_president in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	makeArtifact("voteBoardSenate","congress.VoteBoard",[], VoteBoardSenateID);
	lookupArtifact("voteBoardSenate", VoteBoardSenate);
	focus(VoteBoardSenate).

+law_approved_chamber(D, Par, S, A, R) : true <-
	.print("A received a law approved by Deputies: '", D, "' lets vote in Senate!");
	!voting_in_senate(D, Par, S, A, R).
	
+!voting_in_senate(D, Par, S, A, R) : true <-
	.broadcast(tell, vote_proposal_in_senate(D, Par, S, A, R)).
	
+polling_senate(D, Par, S, A, R, V)[source(O)] : true <- 
	board(V, O, D, Par, S, A, R)[artifact_name("voteBoardSenate")].
	
+vote_ended(D, Par, S, A, R) : law_approved(X) & X = "yes" <-
	.print("All voted, law is approved!");
	.send(president, tell, law_approved_senate(D, Par, S, A, R)).
	
	
+vote_ended(D, Par, S, A, R) : law_approved(X) & X \== "yes" <-
	.print("All voted, law is not approved");
	.send(deputies_president, tell, law_approved(D,"no")).
	
+law_published(N, D, Par, S, A, R) : true <-
	.print("I received the law", N, ". Thank you Mr./Mrs. President").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

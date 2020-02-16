// Agent senate_president in project simulalei

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	makeArtifact("voteBoardSenate","congress.VoteBoard",[], VoteBoardSenateID);
	lookupArtifact("voteBoardSenate", VoteBoardSenate);
	focus(VoteBoardSenate).

+law_approved_chamber(D, S) : true <-
	.print("A received a law approved by Deputies: ", D, "lets vote in Senate!");
	!voting_in_senate(D, S).
	
+!voting_in_senate(D, S) : true <-
	.broadcast(tell, vote_proposal_in_senate(D, S)).
	
+polling_senate(D, S, V)[source(A)] : true <- 
	board(V, A, D, S)[artifact_name("voteBoardSenate")].
	
+vote_ended(D, S) : law_approved(X) & X = "yes" <-
	.print("All voted, law is approved!");
	.send(president, tell, law_approved_senate(D, S)).
	
	
+vote_ended(D, S) : law_approved(X) & X \== "yes" <-
	.print("All voted, law is not approved");
	.send(deputies_president, tell, law_approved(D,"no")).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }

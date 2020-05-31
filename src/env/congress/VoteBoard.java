// CArtAgO artifact code for project simulalei

package congress;

import java.util.ArrayList;
import java.util.List;

import cartago.*;

public class VoteBoard extends Artifact {
	
	List votes = new ArrayList(); //just to record the votes and the name of the agent that voted, this is nominal vote
	int votesInFavor;
	int votesAgainst;
	
	
	void init() {
		this.votesAgainst = 0;
		this.votesInFavor = 0;
		defineObsProperty("voters",5);
		defineObsProperty("law_approved", "no");
	}

	@OPERATION
	void board(Double vote, String politician, String lawDescription, String paragraph, String sanctionList, String action, String role) {

		//the votes are double variable between 0 and 1, the round function works to round the vote to
		//zero or one (vote no and vote yes respectively)
		int voteProcessed = (int) Math.round(vote); 
		boolean infavor = false;
		
		if(voteProcessed == 1) {
			infavor = true;
			this.votesInFavor++;
			System.out.println("Politician = "+politician+" voted YES");
		}
		
		if(voteProcessed == 0) {
			infavor = false;
			this.votesAgainst++;
			System.out.println("Politician = "+politician+" voted NO");
		}
		
		Vote voteCell = new Vote(politician, infavor);
		this.votes.add(voteCell);
		
		//when the voters' count is equal to zero, all votes were collected
		ObsProperty prop = getObsProperty("voters");
	    prop.updateValue(prop.intValue()-1);
	    if(prop.intValue() == 0) this.voteResults(lawDescription, paragraph, sanctionList, action, role);
		
	}
	
	void voteResults(String lawDescription, String paragraph, String sanctionList, String action, String role) {
		
		System.out.println("Votes in favor = "+this.votesInFavor);
		System.out.println("Votes against = "+this.votesAgainst);
		if(this.votesInFavor > this.votesAgainst) {
			ObsProperty prop = getObsProperty("law_approved");
			prop.updateValue("yes");
		}
		signal("vote_ended", lawDescription, paragraph, sanctionList, action, role);
	}
}


// CArtAgO artifact code for project simulalei

package congress;

import java.util.ArrayList;
import java.util.List;

import cartago.*;

public class VoteBoard extends Artifact {
	
	List votes = new ArrayList();
	int votesInFavor;
	int votesAgainst;
	
	
	void init() {
		this.votesAgainst = 0;
		this.votesInFavor = 0;
		defineObsProperty("voters",5);
		defineObsProperty("law_approved", "no");
	}

	@OPERATION
	void board(Double vote, String politician, String lawDescription, String sanctionList) {

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
		
		ObsProperty prop = getObsProperty("voters");
	    prop.updateValue(prop.intValue()-1);
	    if(prop.intValue() == 0) this.voteResults(lawDescription, sanctionList);
		
	}
	
	void voteResults(String lawDescription, String sanctionList) {
		
		System.out.println("Votes in favor = "+this.votesInFavor);
		System.out.println("Votes against = "+this.votesAgainst);
		if(this.votesInFavor > this.votesAgainst) {
			ObsProperty prop = getObsProperty("law_approved");
			prop.updateValue("yes");
		}
		signal("vote_ended", lawDescription, sanctionList);
	}
}


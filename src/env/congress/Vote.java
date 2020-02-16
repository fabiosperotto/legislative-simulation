package congress;

public class Vote {
	
	private String name;
	private boolean vote;
	
	public Vote(String n, boolean v) {
		this.name = n;
		this.vote = v;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isVote() {
		return vote;
	}

	public void setVote(boolean vote) {
		this.vote = vote;
	}
	
	

}

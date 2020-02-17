package congress;

import java.util.ArrayList;
import java.util.List;

import br.com.agentdevlaw.legislation.Norm;

public class NormProcess {
	
	private String normsList;
	private String paragraph;
	private int lawNumber;
	private String role;
	
	public NormProcess(String norms, String p, int n, String r) {
		this.normsList = norms;
		this.paragraph = p;
		this.lawNumber = n;
		this.role = r;
	}
	
	public String getNormsList() {
		return normsList;
	}

	public void setNormsList(String normsList) {
		this.normsList = normsList;
	}

	public String getParagraph() {
		return paragraph;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public int getLawNumber() {
		return lawNumber;
	}

	public void setLawNumber(int lawNumber) {
		this.lawNumber = lawNumber;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * This method is made to break a list of norms from a string, see the initial example with 
	 * the Relator (comptroller) agent
	 * @return ArrayList of Norms
	 */
	public List<Norm> processListNorms() {
		
		List<Norm> norms = new ArrayList<Norm>();
		String[] breakNorms = this.normsList.split("@", -1);
		for(String breaked : breakNorms) {

			String[] normTypeList = breaked.split(">", 2);	
			Norm newNorm = new Norm(this.lawNumber+"-_"+this.paragraph, normTypeList[1], normTypeList[0]);
			newNorm.setRole(this.role); //optional, if empty allRoles is the default
			norms.add(newNorm);
		}
		
		return norms;
	}

}

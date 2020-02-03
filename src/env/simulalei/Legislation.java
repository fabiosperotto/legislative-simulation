// CArtAgO artifact code for project simulalei

package simulalei;

import java.util.ArrayList;
import java.util.List;

import br.com.agentdevlaw.legislation.Law;
import br.com.agentdevlaw.legislation.Norm;
import br.com.agentdevlaw.middleware.QueryProcess;
import br.com.agentdevlaw.ontology.OntologyConfigurator;
import cartago.*;

public class Legislation extends Artifact {
	
	List<ObsProperty> lawList = new ArrayList<ObsProperty>();
	
	void init() {
		
	}

	@OPERATION
	void checkAction(String action) {
		
		OntologyConfigurator ontology = new OntologyConfigurator();
		ontology.setOrigin(OntologyConfigurator.MODEL);
		QueryProcess middleware = new QueryProcess(ontology);
		
		List<Law> laws =  middleware.searchAction(action, getCurrentOpAgentId().getAgentName());
		
		if(!laws.isEmpty()) {

			for(int i = 0; i < laws.size(); i++) {
				System.out.println("Law found -> " + laws.get(i).getIndividual());
				List<Norm> norms = laws.get(i).getNorms();
				System.out.println("Norm needed to apply -> " + norms.get(0).getIndividual());
				for(int j = 0; j < norms.size(); j++) {
					
					signal("legal", norms.get(j).getConsequenceType(), norms.get(j).getConsequence() );
				}
			}
			
		}
	}
	
	@OPERATION
	public void create(Object Id, Object Conceito, String Valor) {
		defineObsProperty("legal", Id, Conceito, Valor);
		ObsProperty aux_sancao = getObsPropertyByTemplate("legal", Id, Conceito, Valor);
		//lawList.add(aux_sancao);

	}
	
	@OPERATION public void removeNorm(Object Id, Object Conceito, String Valor){
			
		removeObsPropertyByTemplate("legal", Id, Conceito, Valor);
	}
	
	@OPERATION void modificaNorma(Object Id, Object Conceito, String Valor){
		ObsProperty prop = getObsProperty("legal");
		prop.updateValues(Conceito, Valor);
	}
}


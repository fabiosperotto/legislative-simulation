// CArtAgO artifact code for project simulalei

package congress;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import br.com.agentdevlaw.legislation.Law;
import br.com.agentdevlaw.legislation.Norm;
import br.com.agentdevlaw.middleware.QueryProcess;
import br.com.agentdevlaw.misc.OntologyDate;
import br.com.agentdevlaw.ontology.OntologyConfigurator;
import cartago.*;

public class Publication extends Artifact {
	
	void init() {
		
	}

	@OPERATION
	void newLaw(String description, String paragraph, String sanctions, String role) {

		System.out.println("Processing a new law to the middleware");
		Random r = new Random();
		int lawNumber = r.nextInt((9999 - 1111) + 1) + 1111;
		Law newLaw = new Law("law-"+lawNumber, description);
		
		//the logic above provide the current datetime to the law initial date		
		Calendar calendar = Calendar.getInstance();
		newLaw.setStartDate(OntologyDate.createDateFormat(calendar.get(Calendar.YEAR), 
				calendar.get(Calendar.MONTH), 
				calendar.get(Calendar.DAY_OF_MONTH), 
				calendar.get(Calendar.HOUR), 
				calendar.get(Calendar.MINUTE), 
				calendar.get(Calendar.SECOND)));
		
		NormProcess normProcessor = new NormProcess(sanctions, paragraph, lawNumber, role);
		List<Norm> norms = new ArrayList<Norm>();
		norms = normProcessor.processListNorms();
		newLaw.setNorms(norms);
		
		OntologyConfigurator ontology = new OntologyConfigurator();
		ontology.setOrigin(OntologyConfigurator.MODEL);
		QueryProcess middleware = new QueryProcess(ontology);

		if(middleware.insertNewLaw(newLaw)) {
			System.out.println("A new law was published in legal ontology");
			signal("law_published", lawNumber, description, paragraph, sanctions, role);
		}else {
			signal("law_publishing_error", lawNumber, description, paragraph, sanctions, role);
		}
	}
}


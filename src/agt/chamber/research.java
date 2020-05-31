// Internal action code for project simulalei

package chamber;

import java.util.List;

import br.com.agentdevlaw.legislation.Law;
import br.com.agentdevlaw.legislation.Norm;
import br.com.agentdevlaw.middleware.QueryProcess;
import br.com.agentdevlaw.ontology.OntologyConfigurator;
import jason.*;
import jason.asSemantics.*;
import jason.asSyntax.*;

public class research extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        // execute the internal action
        ts.getAg().getLogger().info("executing internal action 'chamber.research'");
        
        try {
    		System.out.println("Middleware -> verifying law proposal: " + args[0]);
        	
        	StringTerm description = (StringTerm)args[0];
        	StringTerm role = (StringTerm)args[1];
        	StringTerm action = (StringTerm)args[2];
        	StringTerm sanctionsList = (StringTerm)args[3];
        	
        	OntologyConfigurator ontology = new OntologyConfigurator();
    		ontology.setOrigin(OntologyConfigurator.MODEL);
    		QueryProcess middleware = new QueryProcess(ontology);
    		List<Law> laws =  middleware.searchAction(action.getString(), role.getString());
    		
    		StringTerm lawFind = new StringTermImpl("no");
    		StringTerm lawDescription = new StringTermImpl("");
    		StringTerm lawNorm = new StringTermImpl("");
    		StringTerm lawConsequences = new StringTermImpl("");
    		
    		
    		
    		if(!laws.isEmpty()) {
    			
    			for(int i = 0; i < laws.size(); i++) {
    				System.out.println("Legislation found: "+laws.get(i).getIndividual());
    				lawFind =  new StringTermImpl(laws.get(i).getIndividual());
    				lawDescription = new StringTermImpl(laws.get(i).getDescription());
    				
    				String consequences = "";
    				for(int j = 0; j < laws.get(i).getNorms().size(); j++) {
    					lawNorm = new StringTermImpl(laws.get(i).getNorms().get(j).getIndividual());
    					consequences += laws.get(i).getNorms().get(j).getConsequenceType() + ">"; 
    					consequences += laws.get(i).getNorms().get(j).getConsequence();
    					if(j+1 < laws.get(i).getNorms().size()) consequences += "@";
    				}
    				lawConsequences = new StringTermImpl(consequences);
    				
    				un.unifies(lawDescription, args[5]);
    				un.unifies(lawNorm, args[6]);
    				un.unifies(lawConsequences, args[7]);
    				un.unifies(action, args[8]);
    				un.unifies(role, args[9]);
    			}
    			
    		}
    		
    		if(laws.isEmpty()) {
    			un.unifies(description, args[5]);
    			un.unifies(lawNorm, args[6]);
    			un.unifies(sanctionsList, args[7]);
    			un.unifies(action, args[8]);
    			un.unifies(role, args[9]);
    		}
    		
    		
        	
        	return un.unifies(lawFind, args[4]); //I dont know why 'return un' is not enough to unify to jason
        	
    	}catch (ArrayIndexOutOfBoundsException e) {
			throw new JasonException("The internal action 'research' need 6 parameters");
		}catch (Exception e) {
			throw new JasonException("Something is wrong with the internal action 'action'");
		}
    }
}

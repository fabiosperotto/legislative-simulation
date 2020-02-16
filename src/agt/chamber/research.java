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
    		System.out.println("Verifying law proposal " + args[0]);
        	
        	StringTerm description = (StringTerm)args[0];
        	StringTerm role = (StringTerm)args[1];
        	
        	OntologyConfigurator ontology = new OntologyConfigurator();
    		ontology.setOrigin(OntologyConfigurator.MODEL);
    		QueryProcess middleware = new QueryProcess(ontology);
    		List<Law> laws =  middleware.searchAction(description.getString(), role.getString());
    		
    		StringTerm result =  new StringTermImpl("no");
    		
    		if(!laws.isEmpty()) {
    			StringTerm positive = null;
    			for(int i = 0; i < laws.size(); i++) {
    				System.out.println("Legislation found: "+laws.get(i).getIndividual());
    				result =  new StringTermImpl(laws.get(i).getIndividual());
    				
    			}
    			
//    			return un.unifies(positive, args[2]);
    			
    		}
        	
        	return un.unifies(result, args[2]);
 
        	
    	}catch (ArrayIndexOutOfBoundsException e) {
			throw new JasonException("A acao interna 'action' não recebeu 2 parametros obrigatório");
		}catch (Exception e) {
			throw new JasonException("Algum erro na execucao de internal action 'action'");
		}
    }
}

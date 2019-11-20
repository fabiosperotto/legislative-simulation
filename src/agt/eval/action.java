// Internal action code for project simulalei

package eval;

import java.util.List;

import br.com.agentdevlaw.legislation.Law;
import br.com.agentdevlaw.legislation.Norm;
import br.com.agentdevlaw.middleware.QueryProcess;
import br.com.agentdevlaw.ontology.OntologyConfigurator;
import jason.*;
import jason.asSemantics.*;
import jason.asSyntax.*;

public class action extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        // execute the internal action
//        ts.getAg().getLogger().info("executing internal action 'eval.action'");

    	//as duas linhas abaixos operam com regex para extrair o tipo do agente pela asl do Jason
    	String[] agentTypePath = ts.getAg().toString().split(".*/");
    	String[] agentType = agentTypePath[1].split("\\.");
//        System.out.println(">>>" + agentType[0]);
    	
    	try {
    		System.out.println("Acao interna recebeu " + args[0]);
        	
        	StringTerm acao = (StringTerm)args[0];
        	
        	OntologyConfigurator ontology = new OntologyConfigurator();
    		ontology.setOrigin(OntologyConfigurator.SERVER);
    		QueryProcess middleware = new QueryProcess(ontology);
    		List<Law> laws =  middleware.searchAction(acao.getString(), agentType[0]);
    		
    		StringTerm result =  new StringTermImpl("no");
    		
    		if(!laws.isEmpty()) {

    			for(int i = 0; i < laws.size(); i++) {
    				System.out.println("Lei encontrada -> " + laws.get(i).getIndividual());
    				List<Norm> norms = laws.get(i).getNorms();
    				System.out.println("Norma aplicada -> " + norms.get(0).getIndividual());
    				for(int j = 0; j < norms.size(); j++) {
    					
    					StringTerm positive =  new StringTermImpl(norms.get(j).getConsequenceType());
    					return un.unifies(positive, args[1]);
    				}
    			}
    			
    		}
        	
        	return un.unifies(result, args[1]);
 
        	
    	}catch (ArrayIndexOutOfBoundsException e) {
			throw new JasonException("A acao interna 'action' não recebeu 1 parametro obrigatório");
		}catch (Exception e) {
			throw new JasonException("Algum erro na execucao de internal action 'action'");
		}
    	
    }
}

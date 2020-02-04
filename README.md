# Legislative simulation

Projeto de testes e aprendizado com simulações sociais avaliando ações dos agentes através de consultas sobre leis em ontologias. Utiliza o middleware [AgentDevLaw](https://github.com/fabiosperotto/agentdevlaw) em seu último release. Usa como plataforma o ambiente [JaCaMo](http://jacamo.sourceforge.net).


## Informação

- Exemplo de Jason internal action em /src/agt/eval/action.java (Jason);
- Exemplo de artefato Cartago em /src/env/simulalei, neste caso utiliza uma biblioteca de comunicação com uma ontologia que procura ações e retorna informações sobre leis. 

## Extras

- Para incluir a biblioteca agentdevlaw.jar (ou outras), insira a mesma em /lib. Depois clique com o botão direito na biblioteca e selecione a opção Build Path > Add Build Path, a mesma será referenciada em Referenced Libraries tornando-se funcional na aplicação (Jason ou Cartago). Para remover a biblioteca de Referenced Libraries, clique com o botão direito na mesma referenciada e siga nas opções Build Path > Remove from Build Path.

## Javadoc
A documentação da biblioteca encontra-se em /doc, inclua o arquivo .zip clicando com botão direito na biblioteca em Referenced libraries > Properties > Javadoc Location > Javadoc archive.


## Configurações
Inserir agentdevlaw.jar no build path da aplicação (uma cópia deste encontra-se no diretório /lib/agentdevlaw.jar). Na IDE Eclipse: botaõ direito na biblioteca > Build Path > Add to Build Path.
Após inserir no build path, e independente da utilização com artefatos Cartago ou ação interna Jason, poderá ser utilizado como:
```java
OntologyConfigurator ontology = new OntologyConfigurator(); //classe de configuracao para com a ontologia
ontology.setOrigin(OntologyConfigurator.SERVER); //existem duas opcoes da origem da ontologia: 
//SERVER = ontologia esta sendo fornecida por um webservice (Fuseki), 
//MODEL = ontologia consta em arquivo OWL em um diretorio acessivel pela simulacao (ver config.properties)
		
QueryProcess middleware = new QueryProcess(ontology); //processador de consultas
		
List<Law> laws =  middleware.searchAction(String action, String agentRole); //realiza a busca de leis 
//na ontologia, de acordo com uma string de acao do agente e qual o seu papel na sociedade em simulacao 
//(nao obrigatorio, aceita string vazia), 
//retorna uma lista de leis caso as encontrar, ver exemplos de codigo neste projeto
```

## Screenshots

![alt text](./screenshots/jacamo-results.png "Results from the agents' simulations")

Results from the agents' simulations
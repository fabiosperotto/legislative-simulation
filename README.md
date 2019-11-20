## Legislative simulation

Projeto de testes e aprendizado com simulações sociais avaliando ações dos agentes através de consultas sobre leis em ontologias (em breve será repassado middleware em outro repositório). Utiliza como plataforma o ambiente [JaCaMo](http://jacamo.sourceforge.net).


### Informação

- Exemplo de Jason internal action em /src/agt/eval/action.java (Jason);
- Exemplo de artefato Cartago em /src/env/simulalei, neste caso utiliza uma biblioteca de comunicação com uma ontologia que procura ações e retorna informações sobre leis. 

### Extras

- Para incluir a biblioteca agentdevlaw.jar (ou outras), insira a mesma em /lib. Depois clique com o botão direito na biblioteca e selecione a opção Build Path > Add Build Path, a mesma será referenciada em Referenced Libraries tornando-se funcional na aplicação (Jason ou Cartago). Para remover a biblioteca de Referenced Libraries, clique com o botão direito na mesma referenciada e siga nas opções Build Path > Remove from Build Path.

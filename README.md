# Campo Minado

Projeto feito com parceria do canal da Cod3r.com.br

## Conheça o projeto

Baseado em uma lógica um pouco mais complexa, sendo realizado alguns teste para melhorar a implementação. Para como que se possa conhecer um pouco mais do framework do Flutter, que é uma nova forma de criar aplicações Mobile (Android, iOS e Web) com um mesmo código.

## Uma versão mais fácil

### Lógica do Campo Minado

Pode-se dizer que a lógica do campo minado é uma questão de perspectiva baseada na forma de um quadrado.
Clicando em um campo, irá ser revelado algo, o primeiro cliquei é muita questão de sorte, pois pode ser que na hora apareça uma bomba e fim de jogo.
Tudo que você precisa saber é que cada número indica quantas minas têm ao seu lado, nas casas vizinhas. É claro que o objetivo do jogo é conhecer todo o espaço sem minas (ou, equivalentemente, conhecer todo o espaço com minas).
Pode ser que ao clicar tenha o azar de gerar uma recursividade na vizinhaça que não há bomba, clicando em outro ponto, poderá mostrar por exemplo uma outra vizinha que não há bomba.
Agora para resolver é fácil, com um cliquei longo irá marcar os campos não revelado, com o simbolo de uma bomba.
Marcando todos eles poderá clicar no que esteja sem a marcação para ser revelado o que há por de tráz dele, caso não haja bomba irá vencer o jogo. # campo_minado
# campo_minado

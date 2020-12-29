Post name: Deixe seu codigo ruby mais estiloso
Post author: Gabriel Braico Dornas
Post reading time: 07 minutos
Post resume: É uma pena, mas algumas pessoas não pensam em estética quando estão codando. Certamente o uso adequado de espaços e recuo são comuns, mas podemos ir mais fundo que isso. Vamos analisar algumas dicas simples para facilitar seu trabalho na hora de codar.




Post content:
É uma pena, mas algumas pessoas não pensam em estética quando estão codando. Certamente o uso adequado de espaços e recuo são comuns, mas podemos ir mais fundo que isso. É certo que um bom código deve, antes de tudo, ser executado de maneira eficiente. Mas quero ir além. Penso que ele também deve ser legível para quem os criam, depuram e mantêm. Tudo está funcionando e certamente isso é importante, mas, como quem gosta de organização e uniformidade, acredito que codar não se trata somente de seguir boas práticas de implementação. É preciso estilo, sabor e porque não consistência.

Sei que outros já escreveram uma tonelada de artigos sobre esse tópico. Esta é apenas uma pequena tentativa de expressar como gosto de organizar visualmente meu código. Neste sentido Ruby é ótimo pois nos permite grande flexibilidade para deixar o código com ótima aparência. Mas vamos ao que realmente interessa. Considere o seguinte exemplo:

```Ruby
# Primeira versão

require 'time'

class Pedido
attr_reader :id, :item_id, :create_at

attr_accessor :quantidade, :preco_unitario,:update_at

def initialize(params)
@id = params[:id].to_i
@item_id = params[:item_id].to_i
@quantidade = params[:quantidade].to_i
@preco_unitario = BigDecimal(params[:preco_unitario])
@create_at = Time.parse(params[:create_at].to_s)
@update_at = Time.parse(params[:update_at].to_s)
end

def preco_unitario_para_real
preco_unitario.to_f
end
end
```

Mesmo programadores novos saberão o que está errado aqui. Quase dói ao olhar. Mas esse costuma ser o primeiro passo. Aprender como recuar blocos corretamente é a chave para criar um código legível e bonito. Vamos identar adequadamente cada linha. Vale constar que a convenção Ruby preconiza a utilização de 2 espaços para cada "ninho" de código. Sendo assim:

```Ruby
# Segunda Versão

require 'time'

class Pedido
  attr_reader :id, :item_id, :create_at

  attr_accessor :quantidade, :preco_unitario,:update_at

  def initialize(params)
    @id = params[:id].to_i
    @item_id = params[:item_id].to_i
    @quantidade = params[:quantidade].to_i
    @preco_unitario = BigDecimal(params[:preco_unitario])
    @create_at = Time.parse(params[:create_at].to_s)
    @update_at = Time.parse(params[:update_at].to_s)
  end

  def preco_unitario_para_real
    preco_unitario.to_f
  end
end
```

Muito melhor! Agora, graças ao recuo ou identação, podemos ver o que pertence a o que, sendo possível identificar de maneira intuitiva o escopo de cada linha. Mas não para por aqui! Acredito que há uma maneira mais bonita e organizada de exibir nosso attr_reader e attr_accessor.

```Ruby
# Terceira Versão

class Pedido
  attr_reader   :id,
                :item_id,
                :create_at

  attr_accessor :quantidade,
                :preco_unitario,
                :update_at
```
Quebrar cada declaração de atributo em um linha, alinhando-os uns com os outros, deixa a leitura do código muito mais suave. Agora, temos "acessadores" de atributos bem recuados e com quebra de linha. Diga-me: Ficou ou não mais fácil dizer quais atributos são apenas legíveis (attr_reader) e quais têm acesso total à leitura e gravação (attr_accessor)?

Mas quanto ao método de inicialização!? Sim, ele está  legível. No entanto, com tantas linhas, penso que podemos simplificar a leitura. Com base nos alinhamentos feitos acima, o que você é capaz de sugerir? O que acha da seguinte revisão:

```Ruby
  def initialize(params)
    @id             = params[:id].to_i
    @item_id        = params[:item_id].to_i
    @quantidade     = params[:quantidade].to_i
    @preco_unitario = BigDecimal(params[:preco_unitario])
    @create_at      = Time.parse(params[:create_at].to_s)
    @update_at      = Time.parse(params[:update_at].to_s)
  end
```

Para mim, o alinhamento de todos esses operadores de atribuição na mesma coluna cria um bloco de código realmente agradável, consistente e legível. É fácil dizer o que está acontecendo ainda mais rápido do que antes, quando apenas o recuao estava aplicado. Simplesmente alinhamos cada operador de atribuição na coluna com a variável de instância mais longa.

Vamos dar uma olhada em toda a classe Pedido com novo visual:

```Ruby
# Quarta Versão

class Pedido
  attr_reader   :id,
                :item_id,
                :create_at

  attr_accessor :quantidade,
                :preco_unitario,
                :update_at

  def initialize(params)
    @id             = params[:id].to_i
    @item_id        = params[:item_id].to_i
    @quantidade     = params[:quantidade].to_i
    @preco_unitario = BigDecimal(params[:preco_unitario])
    @create_at      = Time.parse(params[:create_at].to_s)
    @update_at      = Time.parse(params[:update_at].to_s)
  end

  def preco_unitario_para_real
    preco_unitario.to_f
  end
end
```
Agora temos uma classe mais fácil de ler, sendo possível entender com apenas uma rápida olhada. O escopo é facilmente identificável, as atribuições em nosso método de inicialização são fáceis de escolher e nossos acessadores de atributos são muito mais fáceis de digerir.

Não para por ai! Tenho mais oportunidades de melhoria para mostrar. Espaçamento e alinhamento também podem ser utilizados para instanciar objetos com vários atributos. Olhe o antes e o depois:

```Ruby
# Antes

Usuario.create(nome_completo: 'João Paulo Santos', userario: 'admin', senha: '123456', confirmacao_senha: '123456', email: 'joaopaulosilva123456@codei.com.br', data_nascimento: '01/01/2000')

# Depois

Usuario.create(
  nome_completo:     'João Paulo Santos',
  userario:          'admin',
  senha:             '123456',
  confirmacao_senha: '123456',
  email:             'joaopaulosilva123456@codei.com.br',
  data_nascimento:   '01/01/2000'
)
```
Mais uma vez, encontramos os mesmos problemas. Antes não conseguíamos nem ver o código inteiro. Trabalhar desta maneira é muito ruim. Perdemos muito tempo percorrendo a área de visualização para conferir todos os atributos do novo usuário. Após a revisão temos algo muito mais amigável.

Por último, considere o seguinte:

```Ruby
# Antes
animais = %w[cachorro vaca gato elefante galinha capivara cobra passaro]

animais.map do |animal|
  animal.capitalize
end
```
Aqui estamos iterando sobre a array animais e a cada elemento aplicando o método de capitalização. Ótimo! Mas como torná-lo mais simples? Acompanhe:

```Ruby
# Depois
animais = %w[cachorro vaca gato elefante galinha capivara cobra passaro]

animais.map(&:capitalize)
```
Chamar o método de capitalização desta maneira reduz o trabalho. Podemos dizer simplesmente "dê-me os animais com a primeira letra maiúscula". Poderoso e flexível, não? O melhor é que funciona em muitas, muitas outras situações, com todos os tipos de iteradores e enumeráveis.

Done!

Para finalizar, como dito inicialmente, esse tópico é geralmente trivial, mas um pouco de cuidado com o uso de espaços e recuo podem deixar seu trabalho em alto nível. Tenha certeza que estas poucas dicas facilitarão trabalho em equipe e a manutenção do código. Você dificilmente trabalhará sozinho, sendo a facilidade de leitura do que você faz por colegas fundamental para a escalabilidade de seus projetos no longo prazo.

Um forte abraço e tudo de bom!

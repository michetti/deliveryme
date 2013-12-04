# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Pizza Hut
pizza_hut = Restaurant.find_or_create_by(
  name: "Pizza Hut",
  subdomain: "pizzahut",
  domain: "pizzahut.com.br"
)

pizza_hut.users.create([
  { email: "admin@pizzahut.com.br", password: "password", password_confirmation: "password", is_owner: true }
])

pizza_hut.products.create([
  { tag_list: "pizza", title: "Pan Pizza", description: "A Pan é uma deliciosa massa que faz da Pizza Hut a pizza mais famosa do mundo. Ela é alta, dourada, crocante por fora e macia por dentro, como só a Pizza Hut sabe fazer.", price: BigDecimal.new("28") },
  { tag_list: "pizza", title: "Fininha", description: "O nome não deixa dúvidas. Massa fina e crocante, assada uniformemente, que realça de maneira única os ingredientes da pizza.", price: BigDecimal.new("26.50") },
  { tag_list: "pizza", title: "Artezanale", description: "Massa tradicional, fina, com uma borda generosa e macia. Inspirada na clássica receita italiana, é uma volta às origens.", price: BigDecimal.new("32") },
  { tag_list: "pizza", title: "Borda Recheada", description: "Massa Artezanale recheada com o delicioso requeijão Pizza Hut, uma surpreendente experiência gastronômica.", price: BigDecimal.new("29") },
  { tag_list: "pizza", title: "Cheesy Pop", description: "Uma exclusividade Pizza Hut. Massa Artezanale com borda de 28 pedacinhos recheados com mussarela e salpicados com tempero especial.", price: BigDecimal.new("22") },

  { tag_list: "bebia", title: "Coca Cola 2 Litros", description: "Coca Cola 2 litros geleada", price: BigDecimal.new("6") },
  { tag_list: "bebia", title: "Coca Cola Zero 2 Litros", description: "Coca Cola Zero 2 litros geleada", price: BigDecimal.new("6") },
  { tag_list: "bebia", title: "Guarana Antartica 2 Litros", description: "Guarana Antartica 2 litros geleada", price: BigDecimal.new("6") },
])

###  Habbibs
habbibs = Restaurant.find_or_create_by(
  name: "Habbibs",
  subdomain: "habbibs",
  domain: "habbibs.com.br"
)

habbibs.users.create([
  { email: "admin@habbibs.com.br", password: "password", password_confirmation: "password", is_owner: true }
])

habbibs.products.create([
  { tag_list: "sfiha", title: "Bibsfiha de Calabresa", description: "O clássico do Habib's com recheio que você sempre quis: calabresa moída e temperada com cebola, salsa e condimentos. CONTÉM GLÚTEN.", price: BigDecimal.new("0.80") },
  { tag_list: "sfiha", title: "Bibsfiha de Carne", description: "A clássica e deliciosa esfiha aberta de carne, com limão, tomate, tahine, cebola e o tempero ultrassecreto e único do Habib’s. Impossível comer só uma! CONTÉM GLÚTEN.", price: BigDecimal.new("0.55") },
  { tag_list: "sfiha", title: "Bibsfiha de Queijo", description: "Esfiha aberta com o saboroso queijo minas frescal derretido e uma pitada de salsa picada para dar um sabor especial. CONTÉM GLÚTEN.", price: BigDecimal.new("0.55") },
  { tag_list: "sfiha", title: "Bibsfiha de Frango", description: "Mais um clássico Habib’s. Esfiha aberta com frango, tomate, cebola e aquele tempero que só o Habib’s tem. CONTÉM GLÚTEN.", price: BigDecimal.new("0.60") },
  { tag_list: "sfiha", title: "Bibsfiha de Espinafre", description: "Deliciosa e nutritiva esfiha aberta com recheio de espinafre, queijo Cremily e o tempero secreto do Habib’s. Para comer de joelhos! CONTÉM GLÚTEN.", price: BigDecimal.new("0.80") },

  { tag_list: "bebia", title: "Coca Cola 2 Litros", description: "Coca Cola 2 litros geleada", price: BigDecimal.new("6") },
  { tag_list: "bebia", title: "Coca Cola Zero 2 Litros", description: "Coca Cola Zero 2 litros geleada", price: BigDecimal.new("6") },
  { tag_list: "bebia", title: "Guarana Antartica 2 Litros", description: "Guarana Antartica 2 litros geleada", price: BigDecimal.new("6") },
])

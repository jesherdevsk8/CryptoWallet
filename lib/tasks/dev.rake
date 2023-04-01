namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    # Cria task rails dev:setup - rails -T dev -> Retorna consulta task criada
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Migrando DB...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você não está em ambiente de desenvolvimento!!!!"
    end
  end

  # Cria task rails dev:add_coins   -  Consulte rails -T dev
  desc "Cadastra moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas....") do
      coins = [{
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg",
        mining_type: MiningType.find_by(acronym: 'PoW')
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZCRfwkqpPvFb3QmmwGONG2i6PsgnqZ3L7dRzCNlaSTB1-ruu5",
        mining_type: MiningType.find_by(acronym: 'PoW')
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://ih1.redbubble.net/image.406055498.8711/ap,550x550,12x12,1,transparent,t.png",
        mining_type: MiningType.find_by(acronym: 'PoS')
      },
      { 
        description: "Iota",
        acronym: "IOT",
        url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
        mining_type: MiningType.find_by(acronym: "MaM")
      },
      { 
        description: "ZCash",
        acronym: "ZEC",
        url_image: "https://www.cryptocompare.com/media/351360/zec.png",
        mining_type: MiningType.find_by(acronym: 'PoW')
      }]
      
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  # Cria task add_mining_types
  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},  
        {description: "Proof of Capacity", acronym: "PoC"},
        {description: "Masked Authenticated Messaging", acronym: "MaM"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
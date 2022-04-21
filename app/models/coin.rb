class Coin < ApplicationRecord
    belongs_to :mining_type #, optional: true

    # métodos .map e .pluck

    # c = Coin.all
    # c.map { |coin| [coin.description, coin.acronym] } #Retorna descrição e sigla do array coin
    # c.map(&:description) #Retorna somente descrição e não aceita mais de uma
    # c.pluck(:description, :acronym) #Aceita retornar mais de um opção
    
end

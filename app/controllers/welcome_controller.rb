class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    
    if @meu_nome.nil?
      @meu_nome = "Jesher Minelli Alves"
    end

    @curso = "Ruby on Rails"
  end
end

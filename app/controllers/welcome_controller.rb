class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - [COOKIE]"
    session[:curso] = "Curso de Ruby on Rails - [SESSION]"
    
    @meu_nome = params[:nome]
    
    if @meu_nome.nil?
      @meu_nome = "Jesher Minelli Alves"
    end

    @curso = params[:curso]
  end
end

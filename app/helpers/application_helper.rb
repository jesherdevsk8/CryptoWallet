module ApplicationHelper
    def locale #Não usado, porém deixado para exemplo
        I18n.locale == :en ? "Inglês" : "Português do Brasil"
    end

    def date_br(data_us) #formatando hora na index da primeira pagina
        data_us.strftime("%d %B %Y")
    end
end

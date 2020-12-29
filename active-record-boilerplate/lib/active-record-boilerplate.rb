require_relative 'application.rb'

module ActiveRecordBoilerplate
  class Estados
    def index
      @testes = Estado.all
    end
  end

  class Municipios
    def contar_municipios
      Municipio.all.count
    end
  end
end

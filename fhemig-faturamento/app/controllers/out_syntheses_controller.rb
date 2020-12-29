class OutSynthesesController < ApplicationController
  require 'csv'

    def index
      # OutSynthesis.delete_all
      # @import = OutSynthesis.all
      abrir_arquivo
    end

    def import
      import_parse
    end

    def abrir_arquivo
      @all_text_files2 = []
      @all_text_files = Dir.glob "txt_files/*.txt"
      @all_text_files.each do |file|
        CSV.foreach(file) do |row|
          @all_text_files2 << row
        end
      end
    end

    def import_parse
      @sintese = {}
      @sinteses = []
      invalid = 0
      # path = 'import.txt'
      puts 'começa aqui'
      CSV.foreach(params[:file].path, encoding:'iso-8859-15:utf-8') do |row|
        puts 'testando'
        p row
        p row.join(',').split[2]
        unidade =
        puts 'testando'
        if !row.empty? &&
          row.join(',').split[0].length == 7 &&
          row.join(',').split[0].match?(/(0[0-9]|1[0-2])\/[1-9][0-9][0-9][0-9]/, 0)
          @sintese[:hospital] = Hospital.find(13)
          @sintese[:procedure] = Procedure.where(cod: row.join(',').split[3].gsub(/\-+/, '')[1, 9]).first
          @sintese[:competence] = Date.strptime(row.join(',').split[0], "%m/%Y")
          @sintese[:sheet] = row.join(',').split[1].to_i
          @sintese[:sequence] = row.join(',').split[2].to_i
          @sintese[:cbo] = row.join(',').split[4]
          @sintese[:quantity_presented] = row.join(',').split[5].to_i
          @sintese[:value_presented] = row.join(',').split[6].gsub(/\,+/, '.').to_f
          @sintese[:quantity__approved] = row.join(',').split[7].to_i
          @sintese[:value_approved] = row.join(',').split[8].gsub(/\,+/, '.').to_f
          @sintese[:situation] = row.join(',').split[9]
          sinteses = OutSynthesis.new(@sintese)
          sinteses.save # Colocar para Salvar todas depois se tudo estiver válido (iteração)
          if sinteses.valid?
            @sinteses << sinteses
          else !sinteses.valid?
            invalid += 1
          end
        end
      end
      redirect_to root_path
    end
end

class OutSynthesesController < ApplicationController
  require 'csv'

    skip_before_action :authenticate_user!

    def index
      # OutSynthesis.delete_all
      # @import = OutSynthesis.all
      abrir_arquivo
      @vpns = Vpn.find_by_sql(vpn_sql)
    end

    def controle
      # OutSynthesis.delete_all
      # @import = OutSynthesis.all
      abrir_arquivo
      @vpns = Vpn.find_by_sql(vpn_sql_controle)
    end

    def feito
    end

    def abrir_arquivo
      VpnImportation.delete_all
      all_text_files = Dir.glob "txt_files/*.txt"
      all_text_files.each do |file|
        importacao = {}
        importacao[:estacao_camg] = file.split("/")[1].split(".")[0]
        endereco_fisico = 0
        CSV.foreach("./#{file}", encoding:'iso-8859-15:utf-8') do |row|
          if !row[0].nil?
            importacao[:host_name] = row[0][49..1000].split('-')[0] if row[0][0..14] == "   Nome do host"
            if row[0][0..15] ==  "   Endereço IPv4" || row[0][0..16] ==  "   EndereÃ§o IPv4"
              importacao[:ip_renovado] = row[0][49..1000].split("(")[0]
            end
            importacao[:patrimonio] = row[0][49..1000][7..1000] if row[0][0..14] == "   Nome do host"
            if row[0][0..17] == "   Endereço Físico" && endereco_fisico == 0
              importacao[:mac] = row[0][49..1000]
              endereco_fisico += 1
            end
            if row[0][0..19] == "   EndereÃ§o FÃ­sico" && endereco_fisico == 0
              importacao[:mac] = row[0][51..1000]
              endereco_fisico += 1
            end
          end
        end
      if !Vpn.where(estacao_camg_renovada: importacao[:estacao_camg].to_i).first.nil?
        Vpn.where(estacao_camg_renovada: importacao[:estacao_camg].to_i).first.update observacao: nil
      end
      VpnImportation.create(importacao)
      end
    end

    def vpn_sql
      sql = "
        SELECT
        v.estacao_camg estacao,
        v.nome,
        vi.ip_renovado ip,
        vi.host_name,
        vi.patrimonio,
        vi.mac,
        v.observacao
        FROM vpns v
        LEFT JOIN vpn_importations vi
        ON vi.estacao_camg = v.estacao_camg_renovada
        WHERE vi.estacao_camg IS NULL
        AND CAST(v.estacao_camg_renovada AS INTEGER) % 2 = 0
         ORDER BY CAST(v.estacao_camg_renovada AS INTEGER) ASC
      "
    end

    def vpn_sql_controle
      sql = "
        SELECT
        v.estacao_camg estacao,
        v.nome,
        vi.ip_renovado ip,
        vi.host_name,
        vi.patrimonio,
        vi.mac,
        v.observacao
        FROM vpns v
        LEFT JOIN vpn_importations vi
        ON vi.estacao_camg = v.estacao_camg_renovada
        ORDER BY CAST(v.estacao_camg_renovada AS INTEGER) ASC
      "
    end
end

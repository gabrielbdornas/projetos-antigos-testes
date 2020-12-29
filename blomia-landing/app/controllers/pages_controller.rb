class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    require 'open-uri'
    require 'nokogiri'
    require "ofx"

    # OFX("extrato.ofx") do |ofx|
    #   c = 1
    #   puts ofx.account.methods
    #   puts ofx.account.type
    #   puts ofx.account.id
    #   puts ofx.account.bank_id
    #   puts ofx.account.instance_variable_names

    #   puts "-----------------"
    #   puts ofx.account.bank_id
    #   puts ofx.account.id
    #   puts ofx.account.type
    #   puts "---------------------"
    #   puts ofx.account.balance.amount
    #   puts ofx.account.balance.methods
    #   puts "------------------"
    #   puts ofx.account.available_balance
    #   puts ofx.account.currency
    #   puts "-----------------"
    #   ofx.account.transactions.each do |a|
    #     p "-----transação #{c}-----"
    #     p "Data: #{a.posted_at}"
    #     p "Valor: #{a.amount.to_f}"
    #     p "Descrição: #{a.memo}"
    #     p "Código que junta data, 0 ou 1 e valor: #{a.fit_id}"
    #     p "Tipo: #{a.fit_id.split("")[8].to_i == 0 ? "Crédito" : "Débito"}"
    #     p "Código da transação: #{a.check_number}"
    #     p "Número de referência: #{a.ref_number}"
    #     p a.name
    #     p a.payee



    #     p a.type
    #     p a.sic
    #     p "-----transação #{c}-----"
    #     puts
    #     c += 1
    #   end
    # end

    # # Cartão de Crédito
    #  OFX("OUROCARD_VISA_INFINITE-Jul_20.ofx") do |ofx|
    #   c = 1
    #   puts ofx.account.transactions.methods
    #   ofx.account.transactions.each do |a|
    #     p "-----transação #{c}-----"
    #     # p "Data: #{a.posted_at}"
    #     # p "Valor: #{a.amount.to_f}"
    #     # p "Descrição: #{a.memo}"
    #     # p "Código que junta data, 0 ou 1 e valor: #{a.fit_id}"
    #     # p "Tipo: #{a.fit_id.split("")[8].to_i == 0 ? "Crédito" : "Débito"}"
    #     # p "Código da transação: #{a.check_number}"
    #     # p "Número de referência: #{a.ref_number}"
    #     # p a.name
    #     # p a.payee



    #     # p a.type
    #     # p a.sic
    #     p a
    #     p "-----transação #{c}-----"
    #     puts
    #     c += 1
    #   end
    # end


  contracheque
  contracheque_final

  end

  def contracheque
    require 'rubygems'
    require 'pdf-reader'
    # Converter PDF
    reader = PDF::Reader.new("contraCheque.pdf")
    reader.pages.each do |page|
      vencimento_liquido = 0
      page.text.split("\n").each do |linha|
        if linha.split("")[5] == "1"
          value = linha[80..200].gsub(/\.+/, '').gsub(/\,+/, '.').split(" ")[1].strip.to_f
          p "#{linha[22..50].strip}: #{value}"
          if linha[22..50].strip == 'VENCIMENTO BASICO'
            vencimento_liquido += value
          elsif linha[22..50].strip == 'ADICIONAL DESEMPENHO'
            vencimento_liquido += value
          elsif linha[22..50].strip == 'GRATIF.GDPI - VARIAV'
            vencimento_liquido += value
          elsif linha[22..50].strip == 'AJ.CUSTO - GSAUDE'
            vencimento_liquido += value
          elsif linha[22..50].strip == 'IMP. RENDA RET.FONTE'
            vencimento_liquido -= value
          elsif linha[22..50].strip == 'CONTRIB.PREV.ART. 28'
            vencimento_liquido -= value
          elsif linha[22..50].strip == 'CECREF-FUNDOASSIST.'
            vencimento_liquido -= value
          elsif linha[22..50].strip == 'CECREF-COTAS/PLANO'
            vencimento_liquido -= value
          elsif linha[22..50].strip == 'CECREF-PLANO SAUDEII'
            vencimento_liquido -= value
          elsif linha[22..50].strip == 'CUSTEIO ALIM. L TRAB'
            vencimento_liquido -= value
          end
        end
      end
      p "VENCIMENTO LÍQUIDO: #{vencimento_liquido}"
    end

    def contracheque_final
      # require 'open-uri'
      # require 'nokogiri'
      # require "ofx"
      # require 'format_parser'
      img_info = FormatParser.parse(File.open("cartao.jpg", "rb"))
      JSON.pretty_generate(img_info)
      puts 'teste1'
      p img_info
      puts 'teste1'
    end
  end
end


class BalancetesController < ApplicationController

  # require 'rubygems'
  # require 'ofx-parser'

  class OfxParser
  end

  def index
    @balancetes = Balancete.all
    byebug
  end

  def import
    # Balancete.import(params[:file])
    #   redirect_to balancetes_path, notice: "Balancete importado com sucesso!"

    require 'open-uri'
    require 'nokogiri'
    require "ofx"

    OFX("file_2.ofx") do |ofx|
      c = 1
      puts ofx.account.methods
      puts ofx.account.type
      puts ofx.account.id
      puts ofx.account.bank_id
      puts ofx.account.instance_variable_names

      puts "-----------------"
      puts ofx.account.bank_id
      puts ofx.account.id
      puts ofx.account.type
      puts "---------------------"
      puts ofx.account.balance.amount
      puts ofx.account.balance.methods
      puts "------------------"
      puts ofx.account.available_balance
      puts ofx.account.currency
      puts "-----------------"
      ofx.account.transactions.each do |a|
        p "-----transação #{c}-----"
        p "Data: #{a.posted_at}"
        p "Valor: #{a.amount.to_f}"
        p "Descrição: #{a.memo}"
        p "Código que junta data, 0 ou 1 e valor: #{a.fit_id}"
        p "Tipo: #{a.fit_id.split("")[8].to_i == 0 ? "Crédito" : "Débito"}"
        p "Código da transação: #{a.check_number}"
        p "Número de referência: #{a.ref_number}"
        p a.name
        p a.payee



        p a.type
        p a.sic
        p "-----transação #{c}-----"
        puts
        c += 1
      end
    end
  end
end

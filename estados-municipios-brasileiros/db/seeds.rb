require_relative '../config/application.rb'
require 'roo'

city = Roo::Spreadsheet.open('RELATORIO_DTB_BRASIL_MUNICIPIO.ods')

city_array = city.sheet(0)

puts city_array.row(2).class





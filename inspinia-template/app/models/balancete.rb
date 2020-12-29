class Balancete < ApplicationRecord



  def self.import(file)
    Balancete.delete_all
    CSV.foreach(file.path) do |row|
      balance_information = {}
      if validate_cnpj!(row) && validate_empty_line!(row) && validate_first_column_number!(row)
        balance_information[:cd_financial_account_company] = informations_account(row, 0, 13)
        balance_information[:cd_financial_account_company_reduction] = informations_account(row, 14, 22)
        balance_information[:financial_account_description] = informations_account(row, 23, 55)
        balance_information[:anterior] = numbers_account(row, 55, 66)
        balance_information[:debt] = numbers_account(row, 68, 81)
        balance_information[:credit] = numbers_account(row, 80, 95)
        balance_information[:moviment] = numbers_account(row, 95, 107)
        balance_information[:current_balance] = numbers_account(row, 108, 118)
      end
      Balancete.create(balance_information) if balance_information.length > 0
    end
  end

  private

  def self.validate_cnpj!(row)
    # Looking for cnpj fild (header of the .csv file) to avoid this
    cnpj = row.join.slice(0..17)
    !cnpj[/\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}/]
  end

  def self.validate_empty_line!(row)
    # Looking for empty lines to avoid theses
    !row.join.slice(23..55).nil?
  end

  def self.validate_first_column_number!(row)
    # Looking for not numbers in first column to avoid theses
    !row.join.slice(0..13).strip.split('.').join.to_i.zero?
  end

  def self.informations_account(row, first_position, second_position)
    # Transform the first three columns of the .csv file
    row.join.slice(first_position..second_position).strip
  end

  def self.numbers_account(row, first_position, second_position)
    # Transform the numeric columns of the .csv file
    row.join(',').slice(first_position..second_position)
       .strip.gsub(/\.+/, '').gsub(/\,+/, '.').to_f
  end
end

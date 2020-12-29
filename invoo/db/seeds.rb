require 'csv'

puts 'Deleting previous data...'
ImportAccount.delete_all
ImportSyntetic.delete_all
ImportInfo.delete_all
CompanyUser.delete_all
Order.delete_all
Company.delete_all
User.delete_all
ChartOfAccount.delete_all

puts 'Creating Chart Of Accounts...'
csv_options_1 = { col_sep: ',', headers: :first_row }
chart_of_accounts = 'chart_of_accounts.csv'
CSV.foreach(chart_of_accounts, csv_options_1) do |row|
  attributes = {}
  attributes[:group_number] = row[1]
  attributes[:sub_group_number] = row[2]
  attributes[:account_number] = row[3]
  attributes[:group] = row[4]
  attributes[:sub_group] = row[5]
  attributes[:account] = row[6]
  attributes[:nature] = row[7]
  ChartOfAccount.create(attributes)
end


puts 'Creating Company...'
company = Company.new(cnpj: '17.480.763/0001-80',
  company_name: 'MINIERA ASSESSORIA LTDA',
  report_system: 'RM',
  state: 'MG',
  zipcode: '30220030',
  address: 'Rua Teste',
  number: '113',
  district: 'Bairro Teste',
  city: 'Cidade Teste',
  complement: 'n/a',
  company_email: 'teste@gmail.com',
  link: nil)
company.save
puts 'Creating User...'
user = User.new(email: 'teste@gmail.com', password: '123456')
user.save
puts 'Creating Company_User...'
company_user = CompanyUser.new(company: company, user: user)
company_user.save

# puts 'Importing tables: ImportInfo, ImportAccounts and ImportSyntetics...'
# csv_options_2 = { col_sep: ';', headers: :first_row }
# import_infos = 'import_infos.csv'
# import_accounts = 'import_accounts.csv'
# import_syntetics = 'import_syntetics.csv'
# CSV.foreach(import_infos, csv_options_2) do |i|
#   infos = {}
#   accounts = {}
#   syntetics = {}
#   infos[:start_date] = i[1]
#   infos[:end_date] = i[2]
#   infos[:company_user_id] = company_user.id
#   import_infos_table = ImportInfo.create(infos)
#   import_infos_table.save

#   count = 0
#   CSV.foreach(import_accounts, csv_options_2) do |a|
#     puts "#{count} - #{a}"
#     count += 1
#     if i[0] == a[0]
#       accounts[:import_info_id] = import_infos_table.id.to_i
#       accounts[:client_account_number] = a[1].strip
#       accounts[:cliente_account_reduction] = a[2].strip.to_i
#       accounts[:client_account_description] = a[3].strip
#       accounts[:before_balance] = a[4].to_f
#       accounts[:before_balance_type] = a[5].strip
#       accounts[:debit] = a[6].to_f
#       accounts[:credit] = a[7].to_f
#       accounts[:balance] = a[9].to_f
#       accounts[:end_balance] = a[10].to_f
#       accounts[:end_balance_type] = a[11]
#       accounts[:chart_of_account_id] = a[12].strip
#       ImportAccount.create(accounts)
#     end
#   end
#   CSV.foreach(import_syntetics, csv_options_2) do |s|
#     if i[0] == s[1]
#       syntetics[:group] = s[0].strip
#       syntetics[:import_info_id] = import_infos_table.id.to_i
#       syntetics[:client_account_number] = s[2].strip
#       syntetics[:cliente_account_reduction] = s[3].strip.to_i
#       syntetics[:client_account_description] = s[4].strip
#       syntetics[:before_balance] = s[5].to_f
#       syntetics[:before_balance_type] = s[6].strip
#       syntetics[:debit] = s[7].strip.to_f
#       syntetics[:credit] = s[8].strip.to_f
#       syntetics[:balance] = s[10]
#       syntetics[:end_balance] = s[12].strip.to_f
#       syntetics[:end_balance_type] = s[13]
#       ImportSyntetic.create(syntetics)
#     end
#   end
# end

puts 'Seed concluded!'


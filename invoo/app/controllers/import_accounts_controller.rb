class ImportAccountsController < ApplicationController

  def import
    if params[:file].nil?
      redirect_to new_company_import_account_path(params[:company_id]), notice: 'Selecione um arquivo em seu computador para
      realizar a importação'
    else
      count = 0
      user = current_user
      import_info_fields = {}
      import_row_fields = {}
      # Verified existing file befor importin process - Take care errors
      # https://stackoverflow.com/questions/8380113/ruby-rails-csv-parsing-invalid-byte-sequence-in-utf-8
      CSV.foreach(params[:file].path, encoding:'iso-8859-15:utf-8', col_sep: ';') do |row|
        # The dates fields are in the first line within the file
        if count == 0
          import_info_fields[:start_date] = row.join.slice(83..92)
          import_info_fields[:end_date] = row.join.slice(96..105)
          # The cnpj field are in the first line within the file
          # Validates if the company alread exist in companies table - Error message
        elsif count == 1 && cnpj_does_not_exist?(row)
          redirect_to new_company_import_account_path(params[:company_id]), notice: 'CNPJ da empresa detectada no arquivo não está cadastrado
          em nossa base de dados. Favor realizar o cadastro da empresa antes de realizar a importação de
          seus balancetes'
          # The cnpj field are in the first line within the file
          # Validates if the company is related to the logged user - Error message
        elsif count == 1 && user_not_in_company?(row, user)
          redirect_to new_company_import_account_path(params[:company_id]), notice: 'Usuário não relacionado ao CNPJ da empresa detectada no
          arquivo importado. Favor realizar a vinculação desta empresa ao usuário logado antes de realizar a
          importação dos balancetes'
          # The cnpj field are in the first line within the file
          # Create de import_info object if everything is correct and checked
        elsif count == 1 && company_not_logged?(row, params[:company_id])
          redirect_to new_company_import_account_path(params[:company_id]), notice: 'Empresa selecionada no
          momento não corresponde ao CNPJ da empresa detectada no arquivo importado. Verifique a empresa selecionada
          no canto superior direito da tela antes de continuar o procedimento.'
          # The cnpj field are in the first line within the file
          # Validates if the company is logged is the same as the imported file - Error message
        elsif count == 1 && !cnpj_does_not_exist?(row) && !user_not_in_company?(row, user)
          # Creation of import_syntetics and import_accounts tables
          # Check if fundamental validation in import file is true
          import_info_fields[:company_user] = company_user(row, user)
          import_row_fields[:import_info] = ImportInfo.create(import_info_fields)
          import_syntetics_account_process(params[:file], import_row_fields)
          if fundamental_validation?(import_row_fields[:import_info])
            structure = import_successfully_structure(import_row_fields[:import_info])
            if structure[:import_accounts_nil].count.zero?
              redirect_to company_exceptions_path(session[:current_company_id]), notice: structure[:message]
            else
              redirect_to edit_company_import_accounts_path(import_info: import_row_fields[:import_info]), notice: structure[:message]
            end
          else
            fundamental_validation_failed(import_row_fields[:import_info])
            redirect_to new_company_import_account_path(params[:company_id]), notice: 'Equação fundamental (Ativo =  Passivo + Patrimônio Líquido + Resultado do Exercício) não é verdadeira,
            não sendo possível concretizar a importação. Check o arquivo selecionado antes de prosseguir.'
          end
        end
        count += 1
      end
    end
  end

  def new
    company = Company.find(params[:company_id])
    company_user = CompanyUser.find_by(company: company)
    @import_infos = ImportInfo.where(company_user: company_user)
    redirect_to company_path(company) if params[:file]
  end

  def edit
    # From-to view process
    @chart_of_accounts = ChartOfAccount.all
    @import_accounts_nil = ImportAccount.where(import_info_id: params[:import_info].to_i, chart_of_account: nil).order(client_account_number: :asc)
  end

  def import_successfully_structure(import_info)
    structure = {}
    import_accounts_count = ImportAccount.where(import_info_id: import_info.id).count
    structure[:import_accounts_nil] = ImportAccount.where(import_info_id: import_info.id, chart_of_account: nil).order(client_account_number: :asc)
    import_accounts_not_nil_count = ImportAccount.where(import_info_id: import_info.id).where.not(chart_of_account: nil).count
    import_accounts_nil_count = structure[:import_accounts_nil].count
    if import_accounts_nil_count.zero?
      structure[:message] = "Equação fundamental (Ativo =  Passivo + Patrimônio Líquido + Resultado do Exercício) verdadeira e balancete importado com sucesso!
      #{import_accounts_count} contas importadas, sendo todas com processo de-para realizado em importações anteriores."
    elsif import_accounts_not_nil_count.zero?
      structure[:message] = "Equação fundamental (Ativo =  Passivo + Patrimônio Líquido + Resultado do Exercício) verdadeira e balancete importado com sucesso!
      #{import_accounts_count} contas importadas, sendo todas primeira importação, exigindo portando, realização de de-para."
    else
      structure[:message] = "Equação fundamental (Ativo =  Passivo + Patrimônio Líquido + Resultado do Exercício) verdadeira e balancete importado com sucesso!
      #{import_accounts_count} contas importadas, sendo #{import_accounts_nil_count} primeiras importações, exigindo, portanto, a realização do processo de de-para e #{import_accounts_not_nil_count} contas com de-para realizado em importações anteriores."
    end
    structure
  end

  def update
    # From-to update process
    params[:chart_of_account_id].each do |p|
      account = ImportAccount.find(p[0].to_i)
      chart_of_account = ChartOfAccount.find(p[1].to_i)
      account.chart_of_account = chart_of_account
      account.save
    end
    redirect_to company_exceptions_path(session[:current_company_id])
  end

  private

  def cnpj_does_not_exist?(row)
    # Validates if the company alread exist in companies table
    company = Company.find_by cnpj: row.join.slice(0..17)
    company.nil?
  end

  def user_not_in_company?(row, user)
    # Validates if the company is related to the logged user
    company_user(row, user).nil?
  end

  def company_user(row, user)
    # Find de company_user - relation between user and theirs companies
    company = company(row)
    company_user = CompanyUser.find_by user: user, company: company
  end

  def company_not_logged?(row, company_params)
    # Check if the user is trying to import and file from logged company
    company_imported = company(row)
    company_logged = Company.find(company_params)
    logged = company_imported == company_logged
    !logged
  end

  def company(row)
    # Find company cnpj in imported file
    company = Company.find_by cnpj: row.join.slice(0..17)
  end

  def import_syntetics_account_process(file, import_row_fields)
    # https://stackoverflow.com/questions/8380113/ruby-rails-csv-parsing-invalid-byte-sequence-in-utf-8
    # Create import_syntetics and import_accounts table
    CSV.foreach(file.path, encoding:'iso-8859-15:utf-8', col_sep: ';') do |row|
      import_syntetics = ImportSyntetic.new
      import_account = ImportAccount.new
      import_permited_accounts = ['1', '1.1', '2', '2.1', '2.2', '2.3', '3', '4']
      if !row[1].nil? && import_permited_accounts.include?(row[0].strip)
        account_number = row[0].strip
        case account_number
        when '1' then import_row_fields[:group] = 'ATIVO'
        when '1.1' then import_row_fields[:group] = 'ATIVO CIRCULANTE'
        when '1.2' then import_row_fields[:group] = 'ATIVO NÃO CIRCULANTE'
        when '2' then import_row_fields[:group] = 'PASSIVO E PATRIMÔNIO LÍQUIDO'
        when '2.1' then import_row_fields[:group] = 'PASSIVO CIRCULANTE'
        when '2.2' then import_row_fields[:group] = 'PASSIVO NÃO CIRCULANTE'
        when '2.3' then import_row_fields[:group] = 'PATRIMÔNIO LÍQUIDO'
        when '3' then import_row_fields[:group] = 'RECEITAS'
        when '4' then import_row_fields[:group] = 'CUSTOS E DESPESAS'
        end
        import_row_fields.delete(:chart_of_account)
        parse_fields(row, import_syntetics, import_row_fields)
      elsif row[0].strip.length == 18
        import_row_fields.delete(:group)
        import_row_fields[:chart_of_account] = find_chart_of_account(import_row_fields[:import_info], informations(row, 0))
        parse_fields(row, import_account, import_row_fields)
      end
    end
  end

  def parse_fields(row, table, import_row_fields)
    # Parse .CSV file and update the correct table
    import_row_fields[:before_balance_type] = account_type(row, 4)
    import_row_fields[:end_balance_type] = account_type(row, 9)
    import_row_fields[:client_account_number] = informations(row, 0)
    import_row_fields[:cliente_account_reduction] = informations(row, 1)
    import_row_fields[:client_account_description] = informations(row, 2)
    import_row_fields[:before_balance] = account_type_number(row, 3, 4)
    import_row_fields[:debit] = numbers(row, 5)
    import_row_fields[:credit] = numbers(row, 6)
    import_row_fields[:balance] = numbers(row, 7)
    import_row_fields[:end_balance] = account_type_number(row, 8, 9)
    table.update(import_row_fields)
  end

  def account_type(row, position)
    # Find the corretct account_type ('D' or 'C') for begining and end balance in imported file
    row[position].nil? ? 'N/A' : row[position].strip
  end

  def informations(row, position)
    # Transform the no numeric columns of the .csv file
    row[position].strip
  end

  def account_type_number(row, number_position, information_position)
    # Define invoO patron for 'C' (negative values) and 'D' (positive values)
    number = numbers(row, number_position)
    information = account_type(row, information_position)
    if information == 'C'
      number * -1
    else
      number
    end
  end

  def numbers(row, position)
    # Transform the numeric columns of the .csv file
    row[position]
       .strip.gsub(/\.+/, '').gsub(/\,+/, '.').to_f
  end

  def find_chart_of_account(import_info, client_account_number)
    # Find chart_of_account_id for accounts alread imported for company
    company = import_info.company_user.company
    chart_of_account = ImportAccount.select(:chart_of_account_id).where(client_account_number: client_account_number, import_info: ImportInfo.where(company_user: CompanyUser.where(company: company))).first
    chart_of_account.nil? || chart_of_account.chart_of_account_id.nil? ? nil : ChartOfAccount.find(chart_of_account.chart_of_account_id)
  end

  def import_account_params
    # Only chart_of_account field can be updated during the from-to process
    params.require(:import_account).permit(:chart_of_account)
  end

  def fundamental_validation?(import_info)
    sql = "
    SELECT SUM(isy.end_balance)
    FROM import_syntetics isy
    WHERE isy.group IN ('ATIVO', 'PASSIVO E PATRIMÔNIO LÍQUIDO', 'RECEITAS', 'CUSTOS E DESPESAS')
    AND isy.import_info_id = #{import_info[:id]}"
    fundamental_validation = ActiveRecord::Base.connection.execute(sql)
    fundamental_validation[0]["sum"].to_i == 0
  end

  def fundamental_validation_failed(import_info)
    ImportSyntetic.where(import_info_id: import_info[:id]).delete_all
    ImportAccount.where(import_info_id: import_info[:id]).delete_all
    ImportInfo.find(import_info[:id]).delete
  end
end

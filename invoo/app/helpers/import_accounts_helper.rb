module ImportAccountsHelper
  def debit_caixa

    caixa_debit = ImportAccount.find_by_sql("SELECT SUM(end_balance) AS sum_end,
      coa.sub_group
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cnpj = '17.480.763/0001-80' AND sub_group = 'ATIVO CIRCULANTE'
      GROUP BY sub_group")
  end

  def datas
    company = params[:company_id]
    sql = "SELECT
      ii.start_date
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY ii.start_date
      ORDER BY ii.start_date"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def grupos
    company = params[:company_id]
    sql = "SELECT
      ii.start_date,
      coa.group,
      SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY ii.start_date, coa.group
      ORDER BY coa.group"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def nodate_grupos
    company = params[:company_id]
    sql = "SELECT
      coa.group,
      SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY coa.group
      ORDER BY coa.group"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def sub_grupos
    company = params[:company_id]
    sql = "SELECT
      ii.start_date,
      coa.group_number,

      coa.group,
      coa.sub_group,
      SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id

      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY ii.start_date, coa.group_number, coa.group, coa.sub_group

      ORDER BY coa.group"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def nodate_subgrupos
    company = params[:company_id]
    sql = "SELECT
      coa.group_number,
      coa.sub_group,
      SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY coa.group_number, coa.sub_group_number, coa.sub_group
      ORDER BY coa.sub_group_number"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def nodate_analiticas
    company = params[:company_id]
    sql = "SELECT coa.sub_group_number, coa.account_number, coa.group,
      coa.sub_group, coa.account, SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY coa.sub_group_number, coa.group, coa.sub_group,
      coa.account, coa.account_number
      ORDER BY coa.group, coa.account_number"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def analiticas
    company = params[:company_id]
    sql = "SELECT ii.start_date, coa.sub_group_number, coa.account_number,
      coa.group, coa.sub_group, coa.account, SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY ii.start_date, coa.sub_group_number, coa.group, coa.sub_group,
      coa.account, coa.account_number
      ORDER BY coa.group, coa.account_number"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def nodate_query
    company = params[:company_id]
    sql = "SELECT coa.group_number, coa.group,
      coa.sub_group_number, coa.sub_group, coa.account_number,
      coa.account, SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY coa.group_number, coa.group, coa.sub_group_number,
      coa.sub_group, coa.account, coa.account_number
      ORDER BY coa.group, coa.account_number"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def date_query
    company = params[:company_id]
    sql = "SELECT ii.start_date, coa.account_number, coa.group,
      coa.sub_group, coa.account, SUM(end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE cu.company_id = '#{company.to_i}'
      GROUP BY ii.start_date, coa.group, coa.sub_group,
      coa.account, coa.account_number
      ORDER BY coa.group, coa.account_number"
    @query_result = ImportAccount.find_by_sql(sql)
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result
  end

  def sum_ac
    ac_sum = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
               'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }
    analiticas.map do |analitica|
      if analitica.sum_end.nil?
        analitica.sum_end = 0
      end
    end
    analiticas.each do |analitica|

      if analitica.start_date.mon == 1
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Jan'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Jan'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Jan'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          ac_sum['Jan'] = ac_sum['Jan']
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Jan'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 2
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Fev'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Fev'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Fev'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          ac_sum['Fev'] = ac_sum['Fev']
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Fev'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 3
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Mar'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Mar'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Mar'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          ac_sum['Mar'] = ac_sum['Mar']
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Mar'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 4
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Abr'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Abr'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Abr'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Abr'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Abr'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 5
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Mai'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Mai'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Mai'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Mai'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Mai'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 6
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Jun'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Jun'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Jun'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Jun'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Jun'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 7
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Jul'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Jul'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Jul'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Jul'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Jul'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 8
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Ago'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Ago'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Ago'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Ago'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Ago'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 9
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Set'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Set'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Set'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Set'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Set'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 10
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Out'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Out'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Out'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Out'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Out'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 11
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Nov'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Nov'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Nov'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Nov'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Nov'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 12
        case analitica.account
        when 'CONTAS A RECEBER'
          ac_sum['Dez'] += analitica.sum_end
        when 'PROVISÃO PARA CRÉDITOS DE LIQUIDAÇÃO DUVIDOSA'
          ac_sum['Dez'] += analitica.sum_end
        when 'ESTOQUES'
          ac_sum['Dez'] += analitica.sum_end
        when 'IMPOSTOS A RECUPERAR'
          # ac_sum['Dez'] += analitica.sum_end
        when 'ADIANTAMENTO A TERCEIROS'
          # ac_sum['Dez'] += analitica.sum_end
        end
      end
    end
    ac_sum
  end

  def sum_pc
    pc_sum = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
               'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }
    analiticas.each do |analitica|
      if analitica.start_date.mon == 1
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Jan'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Jan'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Jan'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Jan'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 2
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Fev'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Fev'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Fev'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Fev'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 3
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Mar'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Mar'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Mar'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Mar'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 4
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Abr'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Abr'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Abr'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Abr'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 5
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Mai'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Mai'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Mai'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Mai'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 6
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Jun'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Jun'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Jun'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Jun'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 7
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Jul'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Jul'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Jul'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Jul'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 8
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Ago'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Ago'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Ago'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Ago'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 9
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Set'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Set'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Set'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Set'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 10
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Out'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Out'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Out'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Out'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 11
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Nov'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Nov'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Nov'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Nov'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 12
        case analitica.account
        when 'FORNECEDORES'
          # pc_sum['Dez'] += analitica.sum_end
        when 'FORNECEDORES CONSIGNADOS'
          pc_sum['Dez'] += analitica.sum_end
        when 'OBRIGAÇÕES SOCIAIS E TRABALHISTAS'
          pc_sum['Dez'] += analitica.sum_end
        when 'OBRIGAÇÕES FISCAIS'
          # pc_sum['Dez'] += analitica.sum_end
        end
      end
    end
    pc_sum
  end

  def ngc_sum
    ngc = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
            'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }

    ngc['Jan'] = sum_ac['Jan'] # - sum_pc['Jan']
    ngc['Fev'] = sum_ac['Fev'] #- sum_pc['Fev']
    ngc['Mar'] = sum_ac['Mar'] #- sum_pc['Mar']
    ngc['Abr'] = sum_ac['Abr'] #- sum_pc['Abr']
    ngc['Mai'] = sum_ac['Mai'] #- sum_pc['Mai']
    ngc['Jun'] = sum_ac['Jun'] #- sum_pc['Jun']
    ngc['Jul'] = sum_ac['Jul'] #- sum_pc['Jul']
    ngc['Ago'] = sum_ac['Ago'] #- sum_pc['Ago']
    ngc['Set'] = sum_ac['Set'] #- sum_pc['Set']
    ngc['Out'] = sum_ac['Out'] #- sum_pc['Out']
    ngc['Nov'] = sum_ac['Nov'] #- sum_pc['Nov']
    ngc['Dez'] = sum_ac['Dez'] #- sum_pc['Dez']
    ngc
  end

  def sum_ae
    ae_sum = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
               'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }
    analiticas.each do |analitica|
      if analitica.start_date.mon == 1
        case analitica.account
        when 'CAIXA'
          # ae_sum['Jan'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Jan'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Jan'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Jan'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 2
        case analitica.account
        when 'CAIXA'
          # ae_sum['Fev'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Fev'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Fev'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Fev'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 3
        case analitica.account
        when 'CAIXA'
          # ae_sum['Mar'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Mar'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Mar'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Mar'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 4
        case analitica.account
        when 'CAIXA'
          # ae_sum['Abr'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Abr'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Abr'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Abr'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 5
        case analitica.account
        when 'CAIXA'
          # ae_sum['Mai'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Mai'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Mai'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Mai'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 6
        case analitica.account
        when 'CAIXA'
          # ae_sum['Jun'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Jun'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Jun'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Jun'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 7
        case analitica.account
        when 'CAIXA'
          # ae_sum['Jul'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Jul'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Jul'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Jul'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 8
        case analitica.account
        when 'CAIXA'
          # ae_sum['Ago'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Ago'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Ago'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Ago'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 9
        case analitica.account
        when 'CAIXA'
          # ae_sum['Set'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Set'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Set'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Set'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 10
        case analitica.account
        when 'CAIXA'
          # ae_sum['Out'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Out'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Out'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Out'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 11
        case analitica.account
        when 'CAIXA'
          # ae_sum['Nov'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Nov'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Nov'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Nov'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 12
        case analitica.account
        when 'CAIXA'
          # ae_sum['Dez'] += analitica.sum_end
        when 'BANCOS'
          # ae_sum['Dez'] += analitica.sum_end
        when 'APLICAÇÕES FINANCEIRAS'
          ae_sum['Dez'] += analitica.sum_end
        when 'OUTROS ATIVOS CIRCULANTES'
          ae_sum['Dez'] += analitica.sum_end
        end
      end
    end
    ae_sum
  end

  def sum_pe
    pe_sum = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
               'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }
    analiticas.each do |analitica|
      if analitica.start_date.mon == 1
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Jan'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Jan'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 2
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Fev'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Fev'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 3
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Mar'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Mar'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 4
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Abr'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Abr'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 5
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Mai'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Mai'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 6
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Jun'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Jun'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 7
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Jul'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Jul'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 8
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Ago'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Ago'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 9
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Set'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Set'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 10
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Out'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Out'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 11
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Nov'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Nov'] += analitica.sum_end
        end
      elsif analitica.start_date.mon == 12
        case analitica.account
        when 'EMPRÉSTIMOS E FINANCIAMENTOS'
          pe_sum['Dez'] += analitica.sum_end
        when 'OUTROS PASSIVOS CIRCULANTES'
          pe_sum['Dez'] += analitica.sum_end
        end
      end
    end
    pe_sum
  end

  def tesouraria
    teso = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
             'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }
    teso['Jan'] = sum_ae['Jan'] - sum_pe['Jan']
    teso['Fev'] = sum_ae['Fev'] - sum_pe['Fev']
    teso['Mar'] = sum_ae['Mar'] - sum_pe['Mar']
    teso['Abr'] = sum_ae['Abr'] - sum_pe['Abr']
    teso['Mai'] = sum_ae['Mai'] - sum_pe['Mai']
    teso['Jun'] = sum_ae['Jun'] - sum_pe['Jun']
    teso['Jul'] = sum_ae['Jul'] - sum_pe['Jul']
    teso['Ago'] = sum_ae['Ago'] - sum_pe['Ago']
    teso['Set'] = sum_ae['Set'] - sum_pe['Set']
    teso['Out'] = sum_ae['Out'] - sum_pe['Out']
    teso['Nov'] = sum_ae['Nov'] - sum_pe['Nov']
    teso['Dez'] = sum_ae['Dez'] - sum_pe['Dez']
    teso
  end

  def cdg_sum
    cdg = { 'Jan': 0, 'Fev': 0, 'Mar': 0, 'Abr': 0, 'Mai': 0, 'Jun': 0,
            'Jul': 0, 'Ago': 0, 'Set': 0, 'Out': 0, 'Nov': 0, 'Dez': 0 }

    cdg['Jan'] = ngc_sum['Jan'] + tesouraria['Jan']
    cdg['Fev'] = ngc_sum['Fev'] + tesouraria['Fev']
    cdg['Mar'] = ngc_sum['Mar'] + tesouraria['Mar']
    cdg['Abr'] = ngc_sum['Abr'] + tesouraria['Abr']
    cdg['Mai'] = ngc_sum['Mai'] + tesouraria['Mai']
    cdg['Jun'] = ngc_sum['Jun'] + tesouraria['Jun']
    cdg['Jul'] = ngc_sum['Jul'] + tesouraria['Jul']
    cdg['Ago'] = ngc_sum['Ago'] + tesouraria['Ago']
    cdg['Set'] = ngc_sum['Set'] + tesouraria['Set']
    cdg['Out'] = ngc_sum['Out'] + tesouraria['Out']
    cdg['Nov'] = ngc_sum['Nov'] + tesouraria['Nov']
    cdg['Dez'] = ngc_sum['Dez'] + tesouraria['Dez']
    cdg
  end
end

# ORDER BY ia.client_account_number ASC

# select
# ta."group",
# ta.sum_end
# from
# (
# SELECT "group", sub_group, account_number,
# SUM (end_balance) AS sum_end
#       FROM import_accounts AS ia
#       INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
#       INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
#       INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
#       INNER JOIN companies AS c ON c.id = cu.company_id
#       WHERE sub_group = 'ATIVO CIRCULANTE'
#     GROUP BY "group", sub_group, coa.account_number
# ) ta
# GROUP BY ta."group", ta.sum_end
# --order by ta.account_number

module CompaniesHelper
  def active_company
    @company_session = Company.find(session[:current_company_id])
  end

  def receita_liquida
    sql = "
    SELECT
    SUM (ia.end_balance)
    FROM import_accounts ia
    INNER JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
    INNER JOIN import_infos ii ON ii.id = ia.import_info_id
    INNER JOIN company_users cu ON cu.id = ii.company_user_id
    INNER JOIN companies c ON c.id = cu.company_id
    WHERE c.id = #{session[:current_company_id]}
    AND coa.sub_group_number IN ('3.001', '3.002')"
  resultado = ActiveRecord::Base.connection.execute(sql)
  end

  def resultado_exercicio
    sql = "
    SELECT
    SUM (ia.end_balance)
    FROM import_accounts ia
    INNER JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
    INNER JOIN import_infos ii ON ii.id = ia.import_info_id
    INNER JOIN company_users cu ON cu.id = ii.company_user_id
    INNER JOIN companies c ON c.id = cu.company_id
    WHERE c.id = #{session[:current_company_id]}
    AND coa.group_number = 3"
  resultado = ActiveRecord::Base.connection.execute(sql)
  end

  def despesa_financeira
    sql = "
    SELECT
    SUM (ia.end_balance)
    FROM import_accounts ia
    INNER JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
    INNER JOIN import_infos ii ON ii.id = ia.import_info_id
    INNER JOIN company_users cu ON cu.id = ii.company_user_id
    INNER JOIN companies c ON c.id = cu.company_id
    WHERE c.id = #{session[:current_company_id]}
    AND coa.sub_group_number = '3.009' -- DESPESAS FINANCEIRAS"
  resultado = ActiveRecord::Base.connection.execute(sql)
  end

  def contas_pagar
    sql = "
    SELECT
    SUM (ia.end_balance)
    FROM import_accounts ia
    INNER JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
    INNER JOIN import_infos ii ON ii.id = ia.import_info_id
    INNER JOIN company_users cu ON cu.id = ii.company_user_id
    INNER JOIN companies c ON c.id = cu.company_id
    WHERE c.id = #{session[:current_company_id]}
    AND coa.sub_group_number = '2.001' -- DESPESAS FINANCEIRAS"
  resultado = ActiveRecord::Base.connection.execute(sql)
  end

  def contas_receber
    sql = "
    SELECT
    SUM (ia.end_balance)
    FROM import_accounts ia
    INNER JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
    INNER JOIN import_infos ii ON ii.id = ia.import_info_id
    INNER JOIN company_users cu ON cu.id = ii.company_user_id
    INNER JOIN companies c ON c.id = cu.company_id
    WHERE c.id = #{session[:current_company_id]}
    AND coa.sub_group_number = '1.001' -- DESPESAS FINANCEIRAS"
  resultado = ActiveRecord::Base.connection.execute(sql)
  end
end



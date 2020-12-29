class DreController < ApplicationController
  def index
    @coa = ChartOfAccount.all.sort_by &:account_number
    sql = "SELECT
      ba.\"group\", SUM(ba.sum_end) FROM (
      SELECT \"group\", SUM (end_balance) AS sum_end
      FROM import_accounts AS ia
      INNER JOIN chart_of_accounts AS coa ON coa.id = ia.chart_of_account_id
      INNER JOIN import_infos AS ii ON ii.id = ia.import_info_id
      INNER JOIN company_users AS cu ON cu.id = ii.company_user_id
      INNER JOIN companies AS c ON c.id = cu.company_id
      WHERE ii.id = 11
      GROUP BY \"group\"
      ORDER BY 1
      ) ba
      GROUP BY ba.\"group\""
    # @records_array = ActiveRecord::Base.connection.execute(sql)
    @query_result = ImportAccount.find_by_sql(sql)
  end
end

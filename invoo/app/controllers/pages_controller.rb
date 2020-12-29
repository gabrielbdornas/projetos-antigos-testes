class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
  end

  def landing
    render :layout => "empty"
  end

  def balancete
    @import_accounts = ImportAccount.all
  end

  def exceptions

  end

  def internal_server_error
    render :layout => "empty"

  end

  def not_found_error
    render :layout => "empty"
  end

# sql code history - delete after

# @import_accounts = ImportAccount.where(import_info_id: (ImportInfo.where(company_user_id: (CompanyUser.where(company_id: params[:id].to_i))))).order(client_account_number: :asc)
# @chart_of_accounts = ChartOfAccount.all
# redirect_to edit_company_import_accounts_path

#   group = "
#     SELECT
#     ba.\"group\",
#     SUM(ba.end_balance)
#     FROM
#     (
#     SELECT
#     ia.*,
#     coa.\"group\",
#     coa.sub_group,
#     coa.account
#     FROM
#     import_accounts ia
#     JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
#     JOIN import_infos ii ON ii.id = ia.import_info_id
#     JOIN company_users cu ON cu.id = ii.company_user_id
#     JOIN companies co ON co.id = cu.company_id
#     WHERE co.id = 1
#     ) ba
#     GROUP BY ba.\"group\"
#   "

#   sub_group = "
#     SELECT
#     ba.sub_group,
#     SUM(ba.end_balance)
#     FROM
#     (
#     SELECT
#     ia.*,
#     coa.\"group\",
#     coa.sub_group,
#     coa.account
#     FROM
#     import_accounts ia
#     JOIN chart_of_accounts coa ON coa.id = ia.chart_of_account_id
#     JOIN import_infos ii ON ii.id = ia.import_info_id
#     JOIN company_users cu ON cu.id = ii.company_user_id
#     JOIN companies co ON co.id = cu.company_id
#     WHERE co.id = 1
#     ) ba
#     GROUP BY ba.sub_group
#   "

#   @group = ActiveRecord::Base.connection.execute(group)
#   @sub_group = ActiveRecord::Base.connection.execute(sub_group)
end

class ChartOfAccount < ApplicationRecord

  def sub_group_and_account
    "#{sub_group} | #{account}"
  end
end

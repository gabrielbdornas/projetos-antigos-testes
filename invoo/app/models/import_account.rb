class ImportAccount < ApplicationRecord
  belongs_to :import_info
  belongs_to :chart_of_account, optional: true
end

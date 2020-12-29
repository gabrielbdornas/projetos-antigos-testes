class ProcedureSubGroup < ApplicationRecord
  belongs_to :procedure_group
  has_many :procedures
end

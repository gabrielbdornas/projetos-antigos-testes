class Account < ApplicationRecord

  rails_admin do
    list do
      field  :code
      field  :name
      field  :type
    end

    create do
      field  :code
      field  :name
      # field :type, :enum do
      #   enum do
      #     ["Cartão de Crédito", "Conta Bancária", "Empréstimo", "Fintech"]
      #   end
      # end
    end

    edit do
      field  :code
      field  :name
      # field :type, :enum do
      #   enum do
      #     ["Cartão de Crédito", "Conta Bancária", "Empréstimo", "Fintech"]
      #   end
      # end
    end
  end
end

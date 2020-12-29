class Company < ApplicationRecord
  has_many :company_users

  attr_accessor :user_id

  after_save do
    CompanyUser.create user: User.find(user_id), company: self
  end

  rails_admin do
    create do
      field :cnpj
      field :formal_name
      field :fantasy_name
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end
end

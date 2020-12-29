class FromToController < ApplicationController
  def index
    @import_accounts = ImportAccount.all.sort_by &:client_account_number
  end
end


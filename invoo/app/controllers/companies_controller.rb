class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update, :destroy]
  def index
    @companies = Company.all
  end


  def new
    @company = Company.new
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      @company_user = CompanyUser.create(user_id: current_user.id, company_id: @company.id)
      @order = Order.create!(company: @company, user: current_user)
      session[:current_company_id] = @company.id
      # redirect_to import_company_import_accounts_path(session[:current_company_id]),
      redirect_to new_company_import_account_path(session[:current_company_id]),
      notice: 'Empresa cadastrada com sucesso. Realize a importação do arquivo .CSV para
              alimentar as demonstrações financeiras e dashboards'
    else
      render :new
    end
  end

  def show
    @company_user = CompanyUser.where(company_id: session[:current_company_id])
    @import_info = ImportInfo.where(company_user_id: @company_user)
    if @company_user.blank?
      redirect_to new_company_path,
      notice: 'Para iniciar o processo de importação de arquivos .CSV é importante realizar o cadastro
              da empresa através do formulário abaixo.'
    elsif @import_info.blank?
      redirect_to new_company_import_account_path(params[:company_id]),
      notice: 'Para alimentar as demonstrações financeiras e dashboards realize a importação dos balancetes
              em formato .CSV'
    end
  end

  def edit
    @companies = Company.all
  end

  def update
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  def company_session
    @company = Company.find(params[:id])
    session[:current_company_id] = @company.id
    redirect_to company_path(@company)
  end

  def default_login
    if current_user.companies.empty?
      redirect_to home_path
    else
      session[:current_company_id] = current_user.companies.first.id
      redirect_to company_path(session[:current_company_id])
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :company_email, :cnpj, :report_system, :zipcode, :address, :number, :complement, :district, :state, :city)
  end
end

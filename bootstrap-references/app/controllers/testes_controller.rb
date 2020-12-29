class ControllerNamePluralPrimeiraMaiusculaController < ApplicationController

  before_action :set_ControllerNameSingularPrimeiraMinuscula, only: [:show, :edit, :update, :destroy]

  def index
    @ControllerNamePluralPrimeiraMinuscula = ControllerNameSingularPrimeiraMaiuscula.all
  end

  def show
  end

  def new
    @ControllerNameSingularPrimeiraMinuscula = ControllerNameSingularPrimeiraMaiuscula.new
  end

  def create
    @ControllerNameSingularPrimeiraMinuscula = ControllerNameSingularPrimeiraMaiuscula.new(ControllerNameSingularPrimeiraMinuscula_params)
    @ControllerNameSingularPrimeiraMinuscula.save
  end

  private

  def set_ControllerNameSingularPrimeiraMinuscula
    @ControllerNameSingularPrimeiraMinuscula = ControllerNameSingularPrimeiraMaiuscula.find(params[:id])
  end

  def ControllerNameSingularPrimeiraMinuscula_params
    params.require(:ControllerNameSingularPrimeiraMinuscula_params).permit(:column_name, :column_name, :column_name)
  end

end

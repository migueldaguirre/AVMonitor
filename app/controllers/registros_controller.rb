class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]


  def index
    @registros =  Registro.all
  end

  def show
  end

  def new
    @registro = Registro.new
  end

  def create
    registro = Registro.create(registro_params)
    redirect_to registro_path(registro)
  end

  def edit
  end

  def update
    @registro.update(params[:registro])
    redirect_to registros_path
  end

  def destroy
    @registro.destroy
    redirect_to registros_path
  end

  private

  def registro_params
    params.require(:registro).permit(:producto, :ubicacion, :precio)
  end

  def set_registro
    @registro = Registro.find(params[:id])
  end

end

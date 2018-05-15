class RegistrosController < ApplicationController

  def index
    @registros =  Registro.all
  end

  def show
    @registro = Registro.find(params[:id])
  end

  def new
    @registro = Registro.new
  end

  def create
    registro = Registro.create(registro_params)
    redirect_to registro_path(registro)
  end

  def edit
    @registro = Registro.find(params[:id])
  end

  def update
    @registro = Registro.find(params[:id])
    @registro.update(params[:registro])
    redirect_to registros_path

  end

  def destroy
  end

  private

  def registro_params
    params.require(:registro).permit(:producto, :ubicacion, :precio)
  end

end

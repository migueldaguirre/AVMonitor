class RegistrosController < ApplicationController

  def index
    @registros =  Registro.all
  end

  def show
    @registro = Registro.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

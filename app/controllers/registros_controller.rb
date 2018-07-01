class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :update]


  def index
    @registros =  Registro.all
  end

  def show
  end

  def new
    @registro = Registro.new
  end

  def create
    @registro = Registro.create(registro_params)
    @registro.user = @user
    if @registro.save
      redirect_to registro_path(@registro)
    else
      render :new
    end
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
    params.require(:registro).permit(:producto, :ubicacion, :precio, :id, :negociacion, :nivel, :user_id)
  end

  def set_user
    @user = current_user
  end

  def set_registro
    @registro = Registro.find(params[:id])
  end

end

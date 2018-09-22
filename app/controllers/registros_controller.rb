class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :update]


  def index
    @registros =  Registro.all
    @productos = Producto.all
    @municipios = Municipio.all
    authorize @registros
    @registros = policy_scope(Registro)

    respond_to do |format|
    format.html
    format.xlsx
    end

  end

  def show
  end

  def new
    @registro = Registro.new
    authorize @registro
  end

  def create
    @registro = Registro.create(registro_params)
    @registro = current_user.registros.build(registro_params)
    @registro.user = @user
    authorize @registro

    if @registro.save
      redirect_to registro_path(@registro)
      flash[:notice] = "Se ha creado un nuevo registro."
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @registro.update(params[:registro])
    # redirect_to registros_path

    if @registro.update(registro_params)
      redirect_to registro_path(@registro)
    else
      render :edit
    end
  end

  def destroy
    @registro.destroy
    redirect_to registros_path
    flash[:alert] = "El registro se ha eliminado."
  end

  private

  def registro_params
    params.require(:registro).permit(:producto_id, :municipio_id, :precio, :id, :negociacion, :nivel, :user_id, :presentacion, :comentario)
  end

  def set_user
    @user = current_user
  end

  def set_registro
    @registro = Registro.find(params[:id])
    authorize @registro
  end

end

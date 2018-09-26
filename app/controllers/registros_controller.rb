class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :update, :new]


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
    # @registro.municipio = @munip_id_select2
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
      @munip_id_select2 = params[:munip_id]
      @registro.municipio = Municipio.find_by_id(@munip_id_select2)
      @prod_id_select2 = params[:prod_id]
      @registro.producto = Producto.find_by_id(@prod_id_select2)
      @registro.save
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
    params.require(:registro).permit(:producto_id, :municipio_id, :precio, :id, :negociacion, :nivel, :user_id, :presentacion, :comentario, :munip_id, :prod_id)
  end

  def set_user
    @user = current_user
  end

  def set_registro
    @registro = Registro.find(params[:id])
    authorize @registro
  end

end

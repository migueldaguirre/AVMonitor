class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :update, :new]

 def validate!
    errors.add(:precio, :blank, message: "Se debe incluir el precio") if precio.nil?
  end

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
    @producto_default = "1"
    @municipio_default = "1"
    @trm_default = Trm.last

  end

  def create
    @registro = Registro.create(registro_params)
    @registro = current_user.registros.build(registro_params)
    @registro.user = @user
    authorize @registro
    @producto_default = "1"
    @municipio_default = "1"


    if @registro.save
      @munip_id_select2 = params[:munip_id]
      @registro.municipio = Municipio.find_by_id(@munip_id_select2)
      @prod_id_select2 = params[:prod_id]
      @registro.producto = Producto.find_by_id(@prod_id_select2)

      if params[:munip_id] == ""
            params[:munip_id] = @municipio_default
          @registro.municipio = Municipio.find_by_id(params[:munip_id])
      end

      if params[:prod_id] == ""
          params[:prod_id] = @producto_default
          @registro.producto = Producto.find_by_id(params[:prod_id])
      end

      if params[:precio] == ""
          params[:precio] = @registro.precio.to_f
      end
          @registro.usd = params[:usd].to_f
          @registro.usd = @registro.usd * @registro.precio

      @registro.save
      redirect_to registro_path(@registro)
      flash[:notice] = "Se ha creado un nuevo registro."
    else
      @munip_id_select2 = params[:munip_id]
      @prod_id_select2 = params[:prod_id]
      render :new
    end
  end

  def edit
      @producto_default = @registro.producto_id
      @municipio_default = @registro.municipio_id
      @trm_default = Trm.last
  end

  def update
    if @registro.update(registro_params)
      @producto_default = @registro.producto_id
      @municipio_default = @registro.municipio_id
      @precio_default = @registro.precio
      @munip_id_select2 = params[:munip_id]
      @registro.municipio = Municipio.find_by_id(@munip_id_select2)
      @prod_id_select2 = params[:prod_id]
      @registro.producto = Producto.find_by_id(@prod_id_select2)

      if params[:munip_id] == ""
            params[:munip_id] = @municipio_default
          @registro.municipio = Municipio.find_by_id(params[:munip_id])
      end
      if params[:prod_id] == ""
          params[:prod_id] = @producto_default
          @registro.producto = Producto.find_by_id(params[:prod_id])
      end


      @registro.save
      redirect_to registro_path(@registro)
      flash[:notice] = "El registro ha sido editado."
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
    params.require(:registro).permit(:producto_id, :municipio_id, :precio, :id, :negociacion, :nivel, :user_id, :presentacion, :comentario, :munip_id, :prod_id, :usd)
  end

  def set_user
    @user = current_user
  end

  def set_registro
    @registro = Registro.find(params[:id])
    authorize @registro
  end

end

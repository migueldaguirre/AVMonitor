class ProductoController < ApplicationController
before_action :set_producto, only: [:index]


  def index
    @productos =  Producto.all
    skip_policy_scope
  end


private

  def producto_params
    params.require(:ProductoController).permit(:marca, :empresa, :ingrediente, :concentracion, :formulacion, :origen)
  end

  def set_producto
    @producto = Producto.find(params[:id])
    authorize @producto
  end

end

class ProductoController < ApplicationController

  def index
    @productos =  Producto.all
    skip_policy_scope
  end
end

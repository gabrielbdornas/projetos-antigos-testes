class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
    # SDK de Mercado Pago
    require 'mercadopago.rb'

    # Configura credenciais
    $mp = MercadoPago.new('TEST-3300448212056586-040102-1f23f7e6ada234a5e0bade62e7ad188e-414928670')

    # Cria um objeto de preferência
    preference_data = {
      "items": [
        {
          "title": "#{@product.name}",
          "unit_price": @product.price.to_i,
          "quantity": 1
        }
      ]

    }
    preference = $mp.create_preference(preference_data)


    # Este valor substituirá a string "<%= @preference_id %>" no seu HTML
    @preference_id = preference["response"]["id"]
  end


  def set_product
    @product = Product.find(params[:id])
  end

end

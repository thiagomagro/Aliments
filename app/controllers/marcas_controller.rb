class MarcasController < ApplicationController
  before_filter :authenticate

  def show
    @marcas = Marca.all
  end

  def new
    @marca = Marca.new
  end

  def marca_alimento
    #@marca = Marca.new(params[:marca])
     @marcas = Marca.all
  end
end


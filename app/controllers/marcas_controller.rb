class MarcasController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate
  before_filter :admin_auth, :only => [:new]

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


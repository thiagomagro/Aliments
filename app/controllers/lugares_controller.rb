class LugaresController < ApplicationController
  include ApplicationHelper
  
  def new
    @usuario_lugar = UsuarioLugar.new
    @usuario_lugar.lugar = Lugar.new
  end
  
  def edit
    @usuario_lugar = UsuarioLugar.find(params[:id])
  end
end

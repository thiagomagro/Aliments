class LugaresController < ApplicationController
  include ApplicationHelper
  
  def new
    @usuario_lugar = UsuarioLugar.new
    @usuario_lugar.lugar = Lugar.new
    @usuario_lugar.usuario = usuario_logged
  end
  
  def edit
    @usuario_lugar = UsuarioLugar.find(params[:id])
  end
end

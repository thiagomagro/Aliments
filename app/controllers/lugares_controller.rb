class LugaresController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate
  #before_filter :admin_auth, :except => [:index]
  
  def new
    @usuario_lugar = UsuarioLugar.new
    @usuario_lugar.lugar = Lugar.new
    @usuario_lugar.usuario = usuario_logged
  end
  
  def edit
    @usuario_lugar = UsuarioLugar.find(params[:id])
  end
end

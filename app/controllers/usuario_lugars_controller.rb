class UsuarioLugarsController < ApplicationController
  def create
  end
  
  def new
    @usuario_lugar = UsuarioLugar.new
    @usuario_lugar.lugar = Lugar.new
  end
  
  def edit
    @usuario_lugar = UsuarioLugar.find(params[:id])
  end
  
  def update
    @usuario_lugar = UsuarioLugar.find(params[:id])
    if @usuario_lugar.update_attributes(params[:usuario_lugar])
      flash[:notice] = "Lugar atualizado"
    end
    #redirect_to :controller=>"usuarios",:action=>"lugares",:id=>@usuario_lugar.usuario.id
    #render "/usuarios/"
    #render :template => "/usuarios/lugares"    
    #redirect_to "/usuarios/lugares"
  end
end

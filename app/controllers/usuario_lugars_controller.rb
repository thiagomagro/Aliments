class UsuarioLugarsController < ApplicationController
  def create
    @usuario_lugar = UsuarioLugar.new(params[:usuario_lugar])
    if @usuario_lugar.save
      flash[:notice] = "Lugar criado com sucesso"
    else
      flash[:notice] = "Erro na validação dos dados"
    end
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

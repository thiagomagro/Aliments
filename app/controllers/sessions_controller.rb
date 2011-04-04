class SessionsController < ApplicationController
  include UsuariosHelper
  
  def new
  end

  def create
    usuario = Usuario.find_by_login_and_senha params[:usuario][:login],params[:usuario][:senha]
    #usuario = Usuario.find_by_login_and_senha_segura params[:usuario][:login],encrypt(params[:usuario][:senha],nil)
    if usuario
      if usuario.senha_segura.nil?
        usuario.senha_segura = encrypt(usuario.senha,nil)
        usuario.save
      end
      session[:usuario] = usuario.id
      redirect_to :controller => :home
    else
      flash[:error] = "Usuario nao encontrado"
      render :new
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    session[:usuarios] = nil
    reset_session
    flash[:notice] = 'Logged out'
    redirect_to :controller => 'home'
  end
end


class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_login_and_senha params[:usuario][:login],params[:usuario][:senha]
    if usuario
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


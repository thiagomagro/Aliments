class SessionsController < ApplicationController
  include UsuariosHelper
  include ApplicationHelper
  
  def new
  end

  def create
    #usuario = Usuario.find_by_login_and_senha params[:usuario][:login],params[:usuario][:senha]
    usuario = Usuario.find_by_login_and_senha_segura params[:usuario][:login],encrypt(params[:usuario][:senha],nil)
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
  
  def fb
    fb_auth = FbGraph::Auth.new(fb_config[:app_id], fb_config[:secret_key])
    auth = fb_auth.from_cookie(cookies)
    if auth.nil?
      flash[:error] = "Usuario nao encontrado"
      redirect_to :action=>"new"
    end
    @usuario=auth.user
    
    if @usuario.nil?
      flash[:error] = "Usuario nao encontrado"
      redirect_to :action=>"new"
    else
      usuario_logado = Usuario.find_by_fb_id(@usuario.identifier.to_s)
      if usuario_logado.nil?
        @usuario = @usuario.fetch
        usuario_logado = Usuario.new
        usuario_logado.nome = @usuario.name
        usuario_logado.email = @usuario.email
        usuario_logado.fb_id = @usuario.identifier.to_s
        usuario_logado.nascimento = @usuario.birthday
        usuario_logado.save(:validate => false)
      end
      session[:usuario] = usuario_logado.id
      redirect_to :controller => :home
      #@usuario.identifier.to_s
      #session[:usuario] = usuario.id
    end
  end
end


class SessionsController < ApplicationController
  include UsuariosHelper
  include ApplicationHelper

  def new
  end

  def create
    #usuario = Usuario.find_by_login_and_senha params[:usuario][:login],params[:usuario][:senha]
    #usuario = Usuario.find_by_login_and_senha_segura(params[:usuario][:login],encrypt(params[:usuario][:senha],nil), :select=>"usuarios.id,usuarios.nome,usuarios.senha_segura,perfils.nome",:include=>[:perfil])
    usuario = Usuario.find(:first,:conditions=>["login=? and senha_segura=?",params[:usuario][:login],encrypt(params[:usuario][:senha],nil)],:select=>"usuarios.id,usuarios.nome,usuarios.senha_segura,perfils.nome",:joins => "left outer join perfils on perfils.id = usuarios.perfil_id")
    
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
    session[:usuario] = nil
    session[:usuario_logado] = nil
    session[:data] = nil
    reset_session
    flash[:notice] = 'Logged out'
    redirect_to :controller => 'home'
  end

  def fb
    fb_auth = FbGraph::Auth.new(fb_config[:app_id], fb_config[:secret_key])
    begin
     auth = fb_auth.from_cookie(cookies)
    rescue
      flash[:error] = "Usuario nao encontrado"
      redirect_to :action=>"new"
      return
    end
    
    if auth.nil?
      flash[:error] = "Usuario nao encontrado"
      redirect_to :action=>"new"
      return
    end
    usuario=auth.user

    if usuario.nil?
      flash[:error] = "Usuario nao encontrado"
      redirect_to :action=>"new"
    else
      usuario_logado = Usuario.find_by_fb_id usuario.identifier.to_s
      if usuario_logado.nil?
        usuario_logado = Usuario.new
      end
      usuario = usuario.fetch
      usuario_logado.nome = usuario.name
      usuario_logado.email = usuario.email
      usuario_logado.fb_id = usuario.identifier.to_s
      usuario_logado.nascimento = usuario.birthday
      usuario_logado.sexo=1 if usuario.gender == "male"
      usuario_logado.sexo=0 if usuario.gender == "female"
      if !usuario_logado.save
        usuario_logado.errors.each do |e|
          print e
        end
        print "ERRO AO SALVAR"
        redirect_to :action=>"new"
        return
      end
      session[:usuario] = usuario_logado.id
      session[:usuario_logado] = usuario_logado
      redirect_to :controller => :home
      #usuario.identifier.to_s
      #session[:usuario] = usuario.id
    end
  end
end

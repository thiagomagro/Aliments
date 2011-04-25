class SessionsController < ApplicationController
  include UsuariosHelper
  
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
    auth = Facebook.auth.from_cookie(cookies)
    authenticate Facebook.identify(auth.user)
    #auth = Facebook.auth.from_cookie(cookies)
    #authenticate Facebook.identify(auth.user)
    #fb_auth = FbGraph::Auth.new(Facebook::APP_ID,Facebook::SECRET)
    #fb_auth.from_cookie(cookies)
    #user = FbGraph::User.me(fb_auth.access_token)
    #user = fb_auth.user
    #print user
    #print user
    
    #page = FbGraph::Page.fetch('smartfmteam')
    
    #print page
    #print fb_auth.user
    #print 
    #print fb_auth.user.name
    #user = FbGraph::User.me(fb_auth.access_token)
    #print user.fetch
    #print fb_auth.user.fetch
    
    
    
    #oauth = Koala::Facebook::OAuth.new(Facebook::APP_ID,Facebook::SECRET)
    #@graph = Koala::Facebook::GraphAPI.new(oauth.get_user_info_from_cookies(cookies)['access_token'])
    #print(@graph)
    #begin
    #  print @graph.get_object("me")
    #rescue
    #  print "Error  #{$!}"
    #end
    #@facebook_cookies = @auth.get_user_info_from_cookie(cookies)
    #@oauth.get_user_info_from_cookies(cookies)
    #redirect_to "https://www.facebook.com/dialog/oauth?client_id=#{Facebook::APP_ID}&redirect_uri=/home"
    #https://www.facebook.com/dialog/oauth?client_id=YOUR_APP_ID&redirect_uri=YOUR_URL
    
  end
end


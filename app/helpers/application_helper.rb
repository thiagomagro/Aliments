module ApplicationHelper
  @@fb_config = nil

  def usuario_logged
    if session[:usuario_logado].nil?
      print "LOADING USUARIO"
      session[:usuario_logado] = Usuario.find(session[:usuario],:select=>"usuario.id,usuario.nome,perfil.id",:include=>[:perfil]) unless session[:usuario].nil?
    end
    return session[:usuario_logado]
  end

  def usuario_logged_refresh
    session[:usuario_logado] = Usuario.find session[:usuario] unless session[:usuario].nil?
  end
    

  def usuario_logged?
    session[:usuario].nil?
  end

  def usuario_admin?
    unless session[:usuario_logado].nil?
      #usuario = Usuario.find session[:usuario]
      usuario = session[:usuario_logado]
      return false if usuario.nil?
      if (usuario.perfil.nome.casecmp "administrador")==0
        return true
      else
        return false
      end
    else
      return false;
    end
  end

  def button_for(name, options={})
    return content_tag(:button, name, :class => options[:class], :type => options[:button_type])
  end

  def fb_config
    if @@fb_config.nil?
      print "LOADING FILE"
      @@fb_config = YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env].symbolize_keys
    end
    return @@fb_config
  end
end


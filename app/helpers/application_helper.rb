module ApplicationHelper
  def usuario_logged
    Usuario.find session[:usuario] unless session[:usuario].nil?
  end
  
  def usuario_logged?
    session[:usuario].nil?
  end
  
  def usuario_admin?
    unless session[:usuario].nil?
      usuario = Usuario.find session[:usuario]
      return false unless not (usuario.nil? || usuario.perfil.nil?)
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
end


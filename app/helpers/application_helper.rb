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
     usuario.perfil.nome.casecmp "administrador" unless usuario.nil? || usuario.perfil.nil?
   end
  end
  
  def button_for(name, options={})
      return content_tag(:button, name, :class => options[:class], :type => options[:button_type])
    end
end


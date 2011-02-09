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
end


class UsuarioMailer < ActionMailer::Base
  default :from => "alimentscombr@gmail.com"
  
  def cadastro_ok(usuario)
    mail(:to => usuario.email, :subject => "Bem-vindo à Aliments")
  end
end

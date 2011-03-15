perfils = Perfil.all
if perfils.nil? || perfils.size <= 0
  perfil = Perfil.new(:nome=>"Administrador")
  perfil.save
  perfil = Perfil.new(:nome=>"Usuário")
  perfil.save
  perfil = Perfil.new(:nome=>"Nutricionista")
  perfil.save
  perfil = Perfil.new(:nome=>"Restaurante")
  perfil.save
end

tipos = TipoRefeicao.all

if tipos.nil? || tipos.size <= 0
  tipo = TipoRefeicao.new(:nome=>"Café da manhã")
  tipo.save
  tipo = TipoRefeicao.new(:nome=>"Lanche da Manhã")
  tipo.save
  tipo = TipoRefeicao.new(:nome=>"Almoço")
  tipo.save
  tipo = TipoRefeicao.new(:nome=>"Café da tarde")
  tipo.save
  tipo = TipoRefeicao.new(:nome=>"Lanche da tarde")
  tipo.save
  tipo = TipoRefeicao.new(:nome=>"Jantar")
  tipo.save
  tipo = TipoRefeicao.new(:nome=>"Lanche da noite")
  tipo.save
end
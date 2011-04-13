module BuscaHelper
  def relacionamento?(usuario,relacionado)
    usuario.relacionamentos.each do |r|
      if r.relacionado.id == relacionado.id
        return true
      end
    end
    return false
  end
end

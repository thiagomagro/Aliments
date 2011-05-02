module GruposHelper
  def getGrupos(r)
    groups = {}
    r.refeicao_alimentos.each do |ra|
      cal = componentes_refeicao_alimento(ra)
      ra.alimento.grupo_alimentos.each do |ga|
        groups[ga] = 0 if groups[ga].nil?
        groups[ga] += ga
        
      end
    end
  end
end

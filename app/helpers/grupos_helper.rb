module GruposHelper
  def getGruposInfo(refeicoes,comps)
    groups = {}
    refeicoes.each do |r|
      r.refeicao_alimentos.each do |ra|
        cals = ra.quantidade_gramas * (ra.alimento.componente_alimentos.detect{|i| i.id=208}.quantidade) / ra.alimento.porcao
        ra.alimento.grupo_alimentos.each do |ga|
          porcao=0
          unless ga.grupo.porcao.nil? || ga.porcentagem.nil?
            porcao = cals * ((ga.porcentagem / 100) / ga.grupo.porcao )
          end
          groups[ga.grupo] = 0 if groups[ga.grupo].nil?
          #val = groups[ga]
          groups[ga.grupo] += porcao
        end
      end
    end
    return groups
  end
end

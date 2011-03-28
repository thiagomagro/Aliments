module RefeicaosHelper
  
  def componentes_refeicao(r)
    comps = []
    r.refeicao_alimentos.each do |ra|
    end
    return 120
  end
  
  def componentes_refeicao_alimento(ra)
    comps = {}
      ra.alimento.componente_alimentos.each do |ca|
        comps[ca.componente.id] = 0 if comps[ca.componente.id].nil?
        #logger.info(ca.quantidade)
        comps[ca.componente.id] = comps[ca.componente.id] + (ca.quantidade / ra.alimento.porcao) unless ca.quantidade.nil?
      end
      return comps
  end
end

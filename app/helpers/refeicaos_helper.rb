module RefeicaosHelper
  
  def componentes_refeicao(r)
    comps = {}
    r.refeicao_alimentos.each do |ra|
      comps_ra = componentes_refeicao_alimento(ra)
      comps_ra.keys.each do |k|
        comps[k] = 0 if comps[k].nil?
        comps[k] = comps[k] + (comps_ra[k])
      end
    end
    return comps
  end
  
  def componentes_refeicao_alimento(ra)
    comps = {}
      ra.alimento.componente_alimentos.each do |ca|
        comps[ca.componente.id] = 0 if comps[ca.componente.id].nil?
        #logger.info(ca.quantidade)
        comps[ca.componente.id] = comps[ca.componente.id] + ((ca.quantidade / ra.alimento.porcao)*ra.quantidade_gramas) unless ca.quantidade.nil?
      end
      return comps
  end
end

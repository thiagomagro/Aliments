module RefeicaosHelper
  def componentes_refeicoes(rs){
    comps = {}
    rs.each do |r|
      cr = componentes_refeicao(r)
      cr.keys.each do |k|
        comps[k] = 0 if comps[k].nil?
        comps[k] = comps[k] + (cr[k])
      end
    end
    return comps
  }
  
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
  
  def refeicoes(usuario,date)
    refeicoes = Refeicao.find(:all,:conditions => ["extract(day from data) = ? AND extract(month from data) = ? AND extract(year from data) = ? AND usuario_id=?", date.day, date.month, date.year,usuario.id]).sort{|a,b| b.data <=> b.data}
    return refeicoes
  end
end

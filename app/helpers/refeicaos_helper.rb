module RefeicaosHelper
  def componentes_refeicoes(rs)
    comps = {}
    rs.each do |r|
      cr = componentes_refeicao(r)
      cr.keys.each do |k|
        comps[k] = 0 if comps[k].nil?
        comps[k] = comps[k] + (cr[k])
      end
    end
    return comps
  end
  
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
  
  def refeicoes_data(usuario,date)
    refeicoes = Refeicao.find(:all,:conditions => ["extract(day from data) = ? AND extract(month from data) = ? AND extract(year from data) = ? AND usuario_id=?", date.day, date.month, date.year,usuario.id]).sort{|a,b| b.data <=> b.data}
    return refeicoes
  end
  
  def refeicoes(usuario)
    refeicoes = Refeicao.find(:all,:conditions => ["usuario_id=?",usuario.id]).sort{|a,b| b.data <=> b.data}
    return refeicoes
  end
  
  def refeicoes_dias(refeicoes)
    datas = {}
    refeicoes.each do |r|
      data_s = r.data.strftime("%d/%m/%y")
      datas[data_s] = [] if datas[data_s].nil?
      datas[data_s] << r
    end
    return datas
  end
  
  def dias_array(dias)
    ds = []
    dias.each do |k|
      ds <<  Date.strptime(k, "%d/%m/%y")
    end
    return ds
  end
  
  def calorias_refeicoes(refeicoes)
    comps = componentes_refeicoes(refeicoes)
    return comps[208] unless comps.nil?
  end
  
  def getDatasRefeicao
    @datas = Refeicao.count( :group => "DATE(data)",
    #:conditions => ["created_at >= ? ", 7.days.ago],
    :order => "DATE(data) ASC"
    )
  end
end

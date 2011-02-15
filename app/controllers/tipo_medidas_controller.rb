class TipoMedidasController < ApplicationController
  before_filter :authenticate

  def add_tipo
    tipoMedida = TipoMedida.find(params[:id])
    @alimento = Alimento.new
    tipoMedida.medida_tipo_medidas.each do |mtm|
      @alimento.alimento_medidas.build({:medida => mtm.medida})
    end
    @alimento.alimento_medidas.sort!{|a,b|
      a.medida.nome <=> b.medida.nome
    }
  end

  def importar
    @alimento = Alimento.find(params[:id])
    @alimento.alimento_medidas.each do |a|
      a.id = nil
    end
    @alimento.alimento_medidas.sort!{|a,b|
      a.medida.nome <=> b.medida.nome
    }
  end

end


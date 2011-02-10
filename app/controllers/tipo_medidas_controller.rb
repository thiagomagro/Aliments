class TipoMedidasController < ApplicationController
  before_filter :authenticate
  def addTipo
    tipoMedida = TipoMedida.find(params[:id])
    @alimento = Alimento.new
    tipoMedida.medida_tipo_medidas.each do |mtm|
      @alimento.alimento_medidas.build({:medida => mtm.medida})
    end
    @alimento.alimento_medidas.sort!{|a,b|
      a.medida.nome <=> b.medida.nome
    }
  end
end


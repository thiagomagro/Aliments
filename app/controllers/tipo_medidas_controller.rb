class TipoMedidasController < ApplicationController
  before_filter :authenticate

  def index
    @tipoMedidas = TipoMedida.all.sort{|a,b| a.nome <=> b.nome}
  end
end


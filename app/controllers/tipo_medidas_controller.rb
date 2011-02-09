class TipoMedidasController < ApplicationController
  before_filter :authenticate
  
  def index
    @tipoMedidas = TipoMedida.all.sort{|a,b| a.nome <=> b.nome}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alimentos }
    end
  end
end

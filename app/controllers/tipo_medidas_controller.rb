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
  
  def add_tipo_medida_medidas
    tipo_medida = TipoMedida.find(params[:id])
    @medida_tipo_medida = MedidaTipoMedida.new
    @medida_tipo_medida.tipo_medida = tipo_medida
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
  
  def new
    @tipo_medida = TipoMedida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_medida }
    end
  end
  
  def create
    @tipo_medida = TipoMedida.new(params[:tipo_medida])
    respond_to do |format|
      if @tipo_medida.save
        format.html { redirect_to(@tipo_medida, :notice => 'Medida was successfully created.') }
        format.xml  { render :xml => @tipo_medida, :status => :created, :location => @tipo_medida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_medida.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @tipo_medida = TipoMedida.find(params[:id])
  end
  
  def index
    @tipo_medidas = TipoMedida.all.sort{|a,b| a.nome <=> b.nome}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_medidas }
    end
  end
  
  def update
    @tipo_medida = TipoMedida.find(params[:id])

    respond_to do |format|
      if @tipo_medida.update_attributes(params[:tipo_medida])
        format.html { redirect_to(@tipo_medida, :notice => 'Tipo de Medida was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_medida.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @tipo_medida = TipoMedida.find(params[:id])
    @tipo_medida.destroy
    respond_to do |format|
      format.html { redirect_to(tipo_medidas_url) }
      format.xml  { head :ok }
    end
  end
  
  def show
    @tipo_medida = TipoMedida.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_medida }
    end    
  end

end


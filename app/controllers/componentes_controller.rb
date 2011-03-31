class ComponentesController < ApplicationController
  def index
    @componentes = Componente.where("ativo=?",true).order("ordem asc, nome asc")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alimentos }
    end
  end
  
  def create
    @alimento = Alimento.new(params[:alimento])
    
    respond_to do |format|
      if @alimento.save
        format.html { redirect_to(@alimento, :notice => 'Alimento was successfully created.') }
        format.xml  { render :xml => @alimento, :status => :created, :location => @alimento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alimento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @componente = Componente.find(params[:id])
  end
  
  def new
    @componente = Componente.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @componente }
    end
  end
  
  def update
    @componente = Componente.find(params[:id])
    
    respond_to do |format|
      if @componente.update_attributes(params[:componente])
        format.html { redirect_to(:action=>'index', :notice => 'Nutriente atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @componente.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    @componente = Componente.new(params[:componente])
    @componente.ativo=true
    respond_to do |format|
      if @componente.save
        format.html { redirect_to(:action=>'index', :notice => 'Nutriente criado com sucesso.') }
        format.xml  { render :xml => @componente, :status => :created, :location => @componente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @componente.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @componente = Componente.find(params[:id])
    if(@componente.ativo)
      @componente.ativo=false
    else
      @componente.ativo=true
    end
    
    respond_to do |format|
      if @componente.save
        format.html { redirect_to(:action=>'index', :notice => 'Nutriente criado com sucesso.') }
        format.xml  { render :xml => @componente, :status => :created, :location => @componente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @componente.errors, :status => :unprocessable_entity }
      end
    end
  end
end

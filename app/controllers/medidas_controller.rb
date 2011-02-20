class MedidasController < ApplicationController
  before_filter :authenticate
  # GET /alimentos
  # GET /alimentos.xml
  def index
    #@alimentos = Alimento.all.sort{|a,b| a.nome <=> b.nome}
    @medidas = Medida.all.sort{|a,b| a.nome <=> b.nome}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medidas }
    end
  end
  
  def new
    @medida = Medida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medida }
    end
  end
  
  # GET /alimentos/1/edit
  def edit
    @medida = Medida.find(params[:id])
  end
  
  def show
    @medida = Medida.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medida }
    end    
  end
  
  def create
    @medida = Medida.new(params[:medida])
    respond_to do |format|
      if @medida.save
        format.html { redirect_to(@medida, :notice => 'Medida was successfully created.') }
        format.xml  { render :xml => @medida, :status => :created, :location => @medida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medida.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @medida = Medida.find(params[:id])

    respond_to do |format|
      if @medida.update_attributes(params[:medida])
        format.html { redirect_to(@medida, :notice => 'Medida was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medida.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @medida = Medida.find(params[:id])
    @medida.destroy
    #@alimento.destroy
    respond_to do |format|
      format.html { redirect_to(medidas_url) }
      format.xml  { head :ok }
    end
  end
end

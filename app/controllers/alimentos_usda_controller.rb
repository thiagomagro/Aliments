class AlimentosUsdaController < ApplicationController
  before_filter :authenticate
  # GET /alimentos
  # GET /alimentos.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alimentos }
    end
  end

  def show
  end

  # GET /alimentos/new
  # GET /alimentos/new.xml
  def new
    @alimento = Alimento.new
    componentes = Componente.where("ativo=?",true).order("ordem ASC")
    componentes.each do |c|
      @alimento.componente_alimentos.build({:componente => c})
      #ca = ComponenteAlimento.new(:componente => c)
      #@alimento.componente_alimentos.push(ca)
    end

    print @alimento.componente_alimentos

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alimento }
    end
  end

  # GET /alimentos/1/edit
  def edit
    @alimento_usda = AlimentoUsda.find(params[:id])
    @alimento_usda.componente_usda_alimentos.sort!{|a,b|
      a.componente_usda.nome <=> b.componente_usda.nome
    }
  end

  # POST /alimentos
  # POST /alimentos.xml
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

  # PUT /alimentos/1
  # PUT /alimentos/1.xml
  def update
    @alimento = Alimento.find(params[:id])

    respond_to do |format|
      if @alimento.update_attributes(params[:alimento])
        format.html { redirect_to(@alimento, :notice => 'Alimento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alimento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alimentos/1
  # DELETE /alimentos/1.xml
  def destroy
    @alimento = AlimentoUsda.find(params[:id])
    if(@alimento.ativo)
      @alimento.ativo=false
    else
      @alimento.ativo=true
    end

    #@alimento.save
    #redirect_to(:controller=>"alimentos_usda",:action=>"index", :notice => 'Alimento USDA excluído.')
    respond_to do |format|
      if @alimento.save
        format.html {
          redirect_to(:controller=>"alimentos_usda",:action=>"index", :notice => 'Alimento USDA excluído.')
        }
        format.xml  { render :xml => @alimento, :status => :created, :location => @alimento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alimento.errors, :status => :unprocessable_entity }
      end
    end
  end

  def search
    ativo = true
    if(params[:deleted] == "0")
      ativo = false
    end
    search = AlimentoUsda.search() do
          keywords(params[:search])
          #with(:nome).starting_with(params[:search])
          with(:ativo).equal_to ativo
    end
    @action_form = params[:action_form]
    @alimentos = search.results
  end

  def importar
    @alimento = Alimento.new
    alimento_usda = AlimentoUsda.find(params[:id])
    alimento_usda.ativo=false
    alimento_usda.save
    @alimento.nome = alimento_usda.nome
    @alimento.porcao = 100
    componentes = Componente.where("ativo=?",true).order("ordem ASC")
    componentes.each do |c|
      @alimento.componente_alimentos.build({:componente => c})
      #ca = ComponenteAlimento.new(:componente => c)
      #@alimento.componente_alimentos.push(ca)
    end

    alimento_usda.componente_usda_alimentos.each do |cusa|
      @alimento.componente_alimentos.each do |ca|
        if cusa.componente_usda.nome == ca.componente.nome
          ca.quantidade = cusa.quantidade
        end
      end
    end

    #redirect_to :controller=>'alimentos',:action=>'edit', :alimento => @alimento
    render :template => "alimentos/edit"
  end

  def list
    @alimentos = AlimentoUsda.all.sort{|a,b| a.nome <=> b.nome}

  end
end


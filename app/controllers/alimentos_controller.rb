class AlimentosController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate
  before_filter :admin_auth, :except => [:show,:search,:search_form]

  # GET /alimentos
  # GET /alimentos.xml
  def index
    #@alimentos = Alimento.all.sort{|a,b| a.nome <=> b.nome}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alimentos }
    end
  end

  # GET /alimentos/1
  # GET /alimentos/1.xml
  def show
    @alimento = Alimento.find(params[:id])
    @componente_alimentos = ComponenteAlimento.joins(:alimento,:componente).where("alimentos.id = ? and componentes.ativo=?",@alimento.id,true).order("componentes.ordem")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alimento }
    end
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alimento }
    end
  end

  # GET /alimentos/1/edit
  def edit
    @alimento = Alimento.find(params[:id])
    componentes = Componente.where("ativo=true")
    componentes.each do |c|
      existe = false
      @alimento.componente_alimentos.each do |ca|
        existe = true if ca.componente.id == c.id
      end
      unless existe
        ca_new = ComponenteAlimento.new()
        ca_new.alimento = @alimento
        ca_new.componente = c
        @alimento.componente_alimentos << ca_new
      end
    end    

    @alimento.componente_alimentos = @alimento.componente_alimentos.sort_by{|a| a.id}.reverse
    @alimento.alimento_medidas.sort!{|a,b|
      a.medida.nome <=> b.medida.nome
    }
    
=begin
      @remove = []
      over = []      
      @alimento.componente_alimentos.each do |ca|
        if(over.index(ca.componente.id).nil?)
          over << ca.componente.id
        else
          @remove << ca
        end
      end
=end
  end

  # POST /alimentos
  # POST /alimentos.xml
  def create
    @alimento = Alimento.new(params[:alimento])
    @alimento.ativo=true
    respond_to do |format|
      if @alimento.save
        format.html { redirect_to(:action=>'index', :notice => 'Alimento was successfully created.') }
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
    @alimento.ativo=true

    respond_to do |format|
      if @alimento.update_attributes(params[:alimento])
        format.html { redirect_to(:action=>'index', :notice => 'Alimento was successfully updated.') }
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
    @alimento = Alimento.find(params[:id])
    @alimento.ativo = false
    @alimento.save
    #@alimento.destroy
    respond_to do |format|
      format.html { redirect_to(alimentos_url) }
      format.xml  { head :ok }
    end
  end

  def search
    #@search = Alimento.search(params[:search])
    #@alimentos = Alimento.find(:all, :conditions => ['nome LIKE ? ', '%'+params[:search]+'%'])
    @alimentos = Sunspot.search(Alimento) do
        keywords params["search"],:fields => [:nome]
        with(:ativo).equal_to true
        adjust_solr_params do |sunspot_params|
            sunspot_params[:rows] = 1000
        end
    end
    @action_form = params[:action_form]
    #@alimentos = search.results
  end

  def search_form
    @action_form = params[:action_form]
    respond_to do |format|
      format.js # this renders your rjs file
    end
  end
  
  def list
    ativo = true
    if(params[:ativo] == "false")
      ativo = false
    end
    @alimentos = Alimento.where(:ativo=>ativo).sort{|a,b| a.nome <=> b.nome}
  end
  
  def importar
    alimento = Alimento.find(params[:id])
    @alimento = alimento.clone
    alimento.componente_alimentos.each do |ca|
      comp_a = ca.clone
      comp_a.alimento = @alimento
      @alimento.componente_alimentos << comp_a
    end
    alimento.alimento_medidas.each do |am|
      alimento_m = am.clone
      alimento_m.alimento = @alimento
      @alimento.alimento_medidas << alimento_m
    end
    alimento.grupo_alimentos.each do |ga|
      grupo_a = ga.clone
      grupo_a.alimento = @alimento
      @alimento.grupo_alimentos << grupo_a
    end
    marca = alimento.marca
    @alimento.marca = marca
    
    render :action => "edit"
  end

end


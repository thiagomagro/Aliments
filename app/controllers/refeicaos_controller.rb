class RefeicaosController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate
  
  def new
    @refeicao = Refeicao.new
  end
  
  def create
    @refeicao = Refeicao.new(params[:refeicao])
    @refeicao.usuario = usuario_logged
    
    if @refeicao.save
      flash[:success] = "Refeição adicionada com sucesso"
      redirect_to :action=> :list, :data=>@refeicao.data.strftime("%d/%m/%y")
    else
      flash[:error] = "Não foi possível salvar a refeição"
      render :action => "new"
    end
  end
  
  def edit
    @refeicao = Refeicao.find(params[:id])
  end
  
  def update
    @refeicao = Refeicao.find(params[:id])
    if @refeicao.update_attributes(params[:refeicao])
      flash[:success] = "Refeição atualizada com sucesso"
      redirect_to :action=> :list, :data=>@refeicao.data.strftime("%d/%m/%y")
    else
      render :action => "edit"
    end
  end
  
  def list
    if params[:date].nil?
      if(session[:data].nil?)
        @data = Date.today
      else
        @data = session[:data]
      end
    else
      print params[:date][:day]
      print params[:date][:month]
      print params[:date][:year]
      #@data = Date.civil(params[:date][:month].to_i,params[:date][:day].to_i,params[:date][:year].to_i)
      #print params[:date]
      #@data = DateTime.strptime("${params[:date][:day]}/${params[:date][:month]}/${params[:date][:year]}","%d/%m/%y").to_time
      @data = Time.mktime(params[:date][:year],params[:date][:month],params[:date][:day]) 
      session[:data] = @data      
    end
    #@refeicoes = Refeicao.by_usuario_id(usuario_logged.id)
    @grupos = Grupo.all.sort{|a,b| a.nome <=> b.nome}
    @refeicoes = Refeicao.by_usuario_date(@data,usuario_logged)
    #@refeicoes = Refeicao.where(:usuario_id=>usuario_logged.id).sort{|a,b| b.data <=> b.data}
  end
  
  def adicionar_alimento
    alimento = Alimento.find(params[:id])
    @refeicao_alimento = RefeicaoAlimento.new(:alimento => alimento)
  end
  
  def destroy
    @refeicao = Refeicao.find(params[:id])
    
    respond_to do |format|
      if @refeicao.destroy
        format.html { redirect_to(:action=>'list', :notice => 'Nutriente criado com sucesso.') }
        format.xml  { render :xml => @componente, :status => :created, :location => @componente }
      else
        format.html { render :action => "list" }
        format.xml  { render :xml => @componente.errors, :status => :unprocessable_entity }
      end
    end
  end

end

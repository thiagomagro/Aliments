class RefeicaosController < ApplicationController
  include ApplicationHelper
  
  def new
    @refeicao = Refeicao.new
  end
  
  def create
    @refeicao = Refeicao.new(params[:refeicao])
    @refeicao.usuario = usuario_logged
    
    if @refeicao.save
      redirect_to :action=> :list, :data=>@refeicao.data.strftime("%d/%m/%y")
    else
      render :action => "new"
    end
  end
  
  def edit
    @refeicao = Refeicao.find(params[:id])
  end
  
  def update
    @refeicao = Refeicao.find(params[:id])    
    if @refeicao.update_attributes(params[:refeicao])
        redirect_to :action=> :list, :data=>@refeicao.data.strftime("%d/%m/%y")
    else
        render :action => "edit"
    end
  end
  
  def list
    if !params[:data].nil?
      @data = DateTime.strptime(params[:data],"%d/%m/%y").to_time
      session[:data] = @data
    else
      if(session[:data].nil?)
        @data = Date.today
      else
        @data = session[:data]
      end
    end

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

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
    @data = Date.today
    if !params[:data].nil?
      @data = DateTime.strptime(params[:data],"%d/%m/%y").to_time
    end
    #@refeicoes = Refeicao.where(:usuario_id=>usuario_logged.id).sort{|a,b| b.data <=> b.data}
  end
  
  def adicionar_alimento
    alimento = Alimento.find(params[:id])
    @refeicao_alimento = RefeicaoAlimento.new(:alimento => alimento)
  end
end

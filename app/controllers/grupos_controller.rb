class GruposController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate
  before_filter :admin_auth
  
  def adicionar_grupo
    grupo = Grupo.find(params[:id])
    logger.info grupo
    @alimento_grupo = GrupoAlimento.new
    @alimento_grupo.grupo = grupo
    logger.info @alimento_grupo
  end
  
  def list
    @grupos = Grupo.order("nome asc")
  end
  
  def edit
    @grupo = Grupo.find(params[:id])
  end
  
  def update
    @grupo = Grupo.find(params[:id])
    if @grupo.update_attributes(params[:grupo])
      flash[:success] = "Grupo atualizado com sucesso"
      redirect_to :action=> :list
    else
      render :action => "edit"
    end
  end
end


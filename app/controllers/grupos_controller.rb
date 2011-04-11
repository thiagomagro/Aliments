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
end


class GruposController < ApplicationController
  def adicionar_grupo
    grupo = Grupo.find(params[:id])
    logger.info grupo
    @alimento_grupo = GrupoAlimento.new
    @alimento_grupo.grupo = grupo
    logger.info @alimento_grupo
  end
end


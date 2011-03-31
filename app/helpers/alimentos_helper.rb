module AlimentosHelper
  def getTipoMedidas
    @tipos = TipoMedida.all
  end

  def getGruposAlimentos
    @gruposAlimentos = Grupo.all
  end
  
end


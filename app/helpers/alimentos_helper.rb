module AlimentosHelper
  def getTipoMedidas
    @grupos = TipoMedida.all
  end
end

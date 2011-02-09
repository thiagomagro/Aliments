class TipoMedida < ActiveRecord::Base
  has_many :medida_tipo_medidas
  has_many :medidas, :through => :medida_tipo_medidas
end


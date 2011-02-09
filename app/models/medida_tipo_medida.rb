class MedidaTipoMedida < ActiveRecord::Base
  belongs_to :medida
  belongs_to :tipo_medida
end


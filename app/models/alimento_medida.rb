class AlimentoMedida < ActiveRecord::Base
  belongs_to :alimento
  belongs_to :medida
end


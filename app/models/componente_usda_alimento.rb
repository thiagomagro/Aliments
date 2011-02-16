class ComponenteUsdaAlimento < ActiveRecord::Base
  belongs_to :alimento_usda
  belongs_to :componente_usda
end

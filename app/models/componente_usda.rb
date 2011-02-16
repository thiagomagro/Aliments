class ComponenteUsda < ActiveRecord::Base
  has_many :componente_usda_alimentos
  has_many :alimento_usdas, :through => :componente_usda_alimentos
end

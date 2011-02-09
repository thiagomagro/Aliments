class ComponenteAlimento < ActiveRecord::Base
#  default_scope :order => 'componentes.ordem ASC'
  belongs_to :alimento
  belongs_to :componente
end


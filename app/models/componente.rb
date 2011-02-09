class Componente < ActiveRecord::Base
  default_scope :order => 'ordem ASC'
  has_many :componente_alimentos
  has_many :alimentos, :through => :componente_alimentos
end


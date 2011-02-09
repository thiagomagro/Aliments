class Medida < ActiveRecord::Base
  validates_presence_of :nome
  has_many :medida_tipo_medidas, :dependent => :destroy
  has_many :tipo_medidas, :through => :medida_tipo_medidas

  has_many :alimento_medidas, :dependent => :destroy
  has_many :alimentos, :through => :alimento_medidas
end


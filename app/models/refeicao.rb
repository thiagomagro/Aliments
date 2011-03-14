class Refeicao < ActiveRecord::Base
  belongs_to :tipo_refeicao
  belongs_to :usuario
  
  has_many :refeicao_alimentos, :dependent => :destroy
  accepts_nested_attributes_for :refeicao_alimentos,:allow_destroy => true
end

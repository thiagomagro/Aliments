class RefeicaoAlimento < ActiveRecord::Base
  belongs_to :refeicao
  belongs_to :alimento
  belongs_to :medida
  
  validates_presence_of :quantidade_gramas
  # accepts_nested_attributes_for :lugar,:allow_destroy => true
end

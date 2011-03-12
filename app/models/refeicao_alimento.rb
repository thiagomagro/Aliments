class RefeicaoAlimento < ActiveRecord::Base
  belongs_to :refeicao, :alimento
end

class Lugar < ActiveRecord::Base
  validates_presence_of :nome,:endereco,:numero,:cep,:cidade,:estado
  validates_length_of :cep, :minimum => 8
end


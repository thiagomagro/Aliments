class Lugar < ActiveRecord::Base
  validates_presence_of :nome,:endereco,:numero,:cep,:cidade,:estado
  validates :cep, :presence => true, :length => { :minimum => 8 } unless "#{:cep}".empty?
end


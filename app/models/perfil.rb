class Perfil < ActiveRecord::Base
  validates_presence_of :nome
  has_many :usuarios
end


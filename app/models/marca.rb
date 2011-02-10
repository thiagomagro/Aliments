class Marca < ActiveRecord::Base
  validates_presence_of :nome

  has_many :alimentos
end


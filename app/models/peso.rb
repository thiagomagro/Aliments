class Peso < ActiveRecord::Base
  validates_presence_of :peso
  
  belongs_to :usuario
end

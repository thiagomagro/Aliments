class Grupo < ActiveRecord::Base
    validates_presence_of :nome
    has_many :grupo_alimentos
    has_many :alimentos, :through => :grupo_alimentos
end


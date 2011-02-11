class GrupoAlimento < ActiveRecord::Base
    belongs_to :alimento
    belongs_to :grupo
end


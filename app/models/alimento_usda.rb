class AlimentoUsda < ActiveRecord::Base
    validates_presence_of :nome

    has_many :componente_usda_alimentos, :dependent => :destroy
    has_many :componente_usdas, :through => :componente_usda_alimentos, :conditions => ['componente_usdas.ativo = ?',true]

    searchable do
        text :nome
        boolean :ativo, :using => :ativo?
    end

end


class Refeicao < ActiveRecord::Base
  belongs_to :tipo_refeicao
  belongs_to :usuario
  
  has_many :refeicao_alimentos, :dependent => :destroy
  accepts_nested_attributes_for :refeicao_alimentos,:allow_destroy => true
  
  class << self
    def by_usuario_id(id)
      default_select.where("usuario_id=?",id).includes(:usuario,:tipo_refeicao,{:refeicao_alimentos=>{:alimento=>{:componente_alimentos=>:componente}}})
    end
    def default_select
      select("refeicao.id,refeicao.nome")
    end
  end
end

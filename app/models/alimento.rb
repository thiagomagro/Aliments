class Alimento < ActiveRecord::Base
  validates_presence_of :nome, :porcao
  has_one :usuario_aprovacao, :class_name => "Usuario", :foreign_key => "usuario_aprovacao_id"
  has_one :usuario_cadastro, :class_name => "Usuario", :foreign_key => "usuario_cadastro_id"

  belongs_to :marca

  has_many :componente_alimentos, :dependent => :destroy
  has_many :componentes, :through => :componente_alimentos, :conditions => ['componentes.ativo = ?',true]

  has_many :grupo_alimentos, :dependent => :destroy
  has_many :grupos, :through => :grupo_alimentos

  has_many :alimento_medidas, :dependent => :destroy
  has_many :medidas, :through => :alimento_medidas

  accepts_nested_attributes_for :componente_alimentos,:allow_destroy => true
  accepts_nested_attributes_for :alimento_medidas,:allow_destroy => true
  accepts_nested_attributes_for :grupo_alimentos,:allow_destroy => true
  accepts_nested_attributes_for :marca

  searchable do
      text :nome, :stored => true
      long :id, :stored => true
      boolean :ativo, :using => :ativo?
  end

end


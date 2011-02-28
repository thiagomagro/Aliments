class Usuario < ActiveRecord::Base
  validates_presence_of :login,:senha, :email
  attr_protected :id
  belongs_to :perfil
  
  has_many :usuario_lugars, :dependent => :destroy
  has_many :lugars, :through => :usuario_lugars
  accepts_nested_attributes_for :usuario_lugars,:allow_destroy => true
end


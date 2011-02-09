class Usuario < ActiveRecord::Base
  validates_presence_of :login,:senha, :email
  attr_protected :id
  belongs_to :perfil

end


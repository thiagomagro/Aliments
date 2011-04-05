class Usuario < ActiveRecord::Base
  include UsuariosHelper
  include ActiveModel::Validations
  
  validates_presence_of :login, :email, :nome
  #validates_presence_of :senha
  validates_presence_of :senha_segura, :if => :senha_valida?
  validates_presence_of :senha_flag, :if => :senha_valida?
  validates_presence_of :senha_confirmacao, :if => :senha_valida?
  attr_accessor :atualizar_senha, :senha_flag, :senha_confirmacao, :senha_atual
  attr_protected :id
  belongs_to :perfil
  
  has_many :usuario_lugars, :dependent => :destroy
  has_many :lugars, :through => :usuario_lugars
  accepts_nested_attributes_for :usuario_lugars,:allow_destroy => true
  
  has_many :pesos, :dependent => :destroy
  belongs_to :peso
  
  has_many :refeicaos, :dependent => :destroy
  
  def senha_valida?
    return atualizar_senha || new_record?
  end
    
  validates_each :senha_flag do |record, attr, value|
      record.errors.add attr, 'Confirmação de senha inválida' if (value.to_s[0] != :senha_confirmacao) && !:senha_valida?
  end  
  
  #before_save :senha_seguranca, :if => :senha_valida?

#def senha_seguranca
 #   self.senha_segura = encrypt(senha_flag,nil)
#end
end




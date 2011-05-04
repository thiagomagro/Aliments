class Usuario < ActiveRecord::Base
  include UsuariosHelper
  include ApplicationHelper
  include ActiveModel::Validations

  validates_presence_of :login, :if => :login_valido?
  validates_presence_of :email, :nome
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

  has_many :imagems, :dependent => :destroy
  accepts_nested_attributes_for :imagems,:allow_destroy => true

  has_many :albums, :dependent => :destroy
  accepts_nested_attributes_for :albums,:allow_destroy => true

  has_many :relacionamentos, :dependent => :destroy
  accepts_nested_attributes_for :relacionamentos,:allow_destroy => true

  def login_valido?
    if :login.nil? && :fb_login.nil?
      return true
    end
    return false
  end

  def senha_valida?
    if :fb_login.nil?
      return atualizar_senha || new_record?
    else
      return false
    end
  end

  validates_each :senha_flag do |record, attr, value|
    record.errors.add attr, 'Confirmação de senha inválida' if (value.to_s[0] != :senha_confirmacao) && !:senha_valida?
  end  

  searchable do
    text :nome, :stored => true
    long :id, :stored => true
  end  

  class << self
    def by_login_senha_segura(login,senha_segura)
      default_select.joins(:perfil,:peso).where("usuarios.login=? and usuarios.senha_segura=?",login,senha_segura).first
    end
    def by_id(id)
      default_select.joins(:perfil,:peso).where("usuarios.id=?",id).first
    end
    def default_select
      select("usuarios.id,usuarios.nome,usuarios.login,usuarios.senha_segura,usuarios.altura,usuarios.nascimento,usuarios.atividade_fisica,usuarios.sexo,usuarios.fb_id,perfils.nome perfil_nome,pesos.peso as peso_peso")
    end
  end
  
end




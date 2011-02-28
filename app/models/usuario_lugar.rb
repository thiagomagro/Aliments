class UsuarioLugar < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :lugar
  accepts_nested_attributes_for :lugar,:allow_destroy => true
end

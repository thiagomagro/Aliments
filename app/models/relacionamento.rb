class Relacionamento < ActiveRecord::Base
  belongs_to :usuario
  has_one :relacionado, :class_name => "Usuario", :foreign_key => "relacionado_id"
end

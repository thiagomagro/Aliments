class CreateMedidaTipoMedidas < ActiveRecord::Migration
  def self.up
    create_table :medida_tipo_medidas do |t|
      t.integer :medida_id
      t.integer :tipo_medida_id

      t.timestamps
    end
  end

  def self.down
    drop_table :medida_tipo_medidas
  end
end

class CreateAlimentoMedidas < ActiveRecord::Migration
  def self.up
    create_table :alimento_medidas do |t|
      t.integer :alimento_id
      t.integer :medida_id
      t.float :quantidade
      t.timestamps
    end
  end

  def self.down
    drop_table :alimento_medidas
  end
end


class CreateComponenteAlimentos < ActiveRecord::Migration
  def self.up
    create_table :componente_alimentos do |t|
      t.float :quantidade
      t.float :porcao
      t.string :observacao
      t.integer :alimento_id
      t.integer :componente_id
      t.timestamps
    end
  end

  def self.down
    drop_table :componente_alimentos
  end
end


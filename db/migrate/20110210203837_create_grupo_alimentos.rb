class CreateGrupoAlimentos < ActiveRecord::Migration
  def self.up
    create_table :grupo_alimentos do |t|
      t.integer :alimento_id
      t.integer :grupo_id
      t.float :porcentagem

      t.timestamps
    end
  end

  def self.down
    drop_table :grupo_alimentos
  end
end

class CreateComponenteUsdaAlimentos < ActiveRecord::Migration
  def self.up
    create_table :componente_usda_alimentos do |t|
      t.integer :alimento_usda_id
      t.integer :componente_usda_id
      t.float :quantidade

      t.timestamps
    end
  end

  def self.down
    drop_table :componente_usda_alimentos
  end
end

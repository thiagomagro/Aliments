class CreateComponenteUsdas < ActiveRecord::Migration
  def self.up
    create_table :componente_usdas do |t|
      t.string :nome
      t.string :unidade
      t.boolean :ativo

      t.timestamps
    end
  end

  def self.down
    drop_table :componente_usdas
  end
end

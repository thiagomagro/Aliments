class CreateAlimentoUsdas < ActiveRecord::Migration
  def self.up
    create_table :alimento_usdas do |t|
      t.string :nome
      t.string :undb
      t.boolean :ativo

      t.timestamps
    end
  end

  def self.down
    drop_table :alimento_usdas
  end
end

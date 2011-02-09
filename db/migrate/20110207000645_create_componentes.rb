class CreateComponentes < ActiveRecord::Migration
  def self.up
    create_table :componentes do |t|
      t.string :nome
      t.string :unidade
      t.boolean :ativo
      t.integer :ordem

      t.timestamps
    end
  end

  def self.down
    drop_table :componentes
  end
end

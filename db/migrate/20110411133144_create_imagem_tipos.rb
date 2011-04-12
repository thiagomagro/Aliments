class CreateImagemTipos < ActiveRecord::Migration
  def self.up
    create_table :imagem_tipos do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :imagem_tipos
  end
end

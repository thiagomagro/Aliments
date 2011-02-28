class CreateLugars < ActiveRecord::Migration
  def self.up
    create_table :lugars do |t|
      t.string :nome
      t.string :endereco
      t.integer :numero
      t.string :complemento
      t.integer :cep
      t.string :cidade
      t.string :estado
      t.string :bairro

      t.timestamps
    end
  end

  def self.down
    drop_table :lugars
  end
end

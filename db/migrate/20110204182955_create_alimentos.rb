class CreateAlimentos < ActiveRecord::Migration
  def self.up
    create_table :alimentos do |t|
      t.string :nome
      t.string :idioma
      t.float :porcao
      t.integer :usuario_cadastro_id
      t.integer :usuario_aprovacao_id
      t.integer :marca_id
      t.string :banco
      t.string :idioma
      t.boolean :ativo


      t.timestamps
    end
    #execute "SELECT setval('alimentos_id_seq', 101508, true);"
  end

  def self.down
    drop_table :alimentos
  end
end


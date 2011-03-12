class CreateRefeicaoAlimentos < ActiveRecord::Migration
  def self.up
    create_table :refeicao_alimentos do |t|
      t.integer :refeicao_id
      t.integer :alimento_id
      t.integer :medida_id
      t.decimal :medida_quantidade
      t.decimal :quantidade_gramas

      t.timestamps
    end
  end

  def self.down
    drop_table :refeicao_alimentos
  end
end

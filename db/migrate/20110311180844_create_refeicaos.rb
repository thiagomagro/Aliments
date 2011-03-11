class CreateRefeicaos < ActiveRecord::Migration
  def self.up
    create_table :refeicaos do |t|
      t.integer :tipo_refeicao_id
      t.integer :lugar_id
      t.date :data
      t.integer :usuario_id
      t.integer :restaurante_id

      t.timestamps
    end
  end

  def self.down
    drop_table :refeicaos
  end
end

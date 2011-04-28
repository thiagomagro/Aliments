class CreateAtividadeFisicas < ActiveRecord::Migration
  def self.up
    create_table :atividade_fisicas do |t|
      t.date :data
      t.decimal :tempo
      t.integer :intensidade
      t.timestamps
    end
  end

  def self.down
    drop_table :atividade_fisicas
  end
end

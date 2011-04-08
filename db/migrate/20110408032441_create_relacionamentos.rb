class CreateRelacionamentos < ActiveRecord::Migration
  def self.up
    create_table :relacionamentos do |t|
      t.integer :usuario_id
      t.integer :relacionado_id
      t.integer :tipo_relacionamento_id
      t.datetime :data

      t.timestamps
    end
  end

  def self.down
    drop_table :relacionamentos
  end
end

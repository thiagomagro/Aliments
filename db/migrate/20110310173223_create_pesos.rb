class CreatePesos < ActiveRecord::Migration
  def self.up
    create_table :pesos do |t|
      t.float :peso
      t.date :data
      t.integer :usuario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pesos
  end
end

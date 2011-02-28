class CreateUsuarioLugars < ActiveRecord::Migration
  def self.up
    create_table :usuario_lugars do |t|
      t.integer :usuario_id
      t.integer :lugar_id

      t.timestamps
    end
  end

  def self.down
    drop_table :usuario_lugars
  end
end

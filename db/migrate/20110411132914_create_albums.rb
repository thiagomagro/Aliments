class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :usuario_id
      t.string :nome
      t.datetime :criado

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end

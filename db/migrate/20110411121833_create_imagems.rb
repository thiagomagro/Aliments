class CreateImagems < ActiveRecord::Migration
  def self.up
    create_table :imagems do |t|
      t.integer :usuario_id
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.datetime :updated_at
      t.integer :imagem_tipo_id
      t.integer :album_id

      t.timestamps
    end
  end

  def self.down
    drop_table :imagems
  end
end

class CreateTagAlimentos < ActiveRecord::Migration
  def self.up
    create_table :tag_alimentos do |t|
      t.string :nome
      t.references :alimento

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_alimentos
  end
end

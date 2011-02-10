class CreateMarcas < ActiveRecord::Migration
  def self.up
    create_table :marcas do |t|
      t.string :nome
      t.string :site
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :marcas
  end
end

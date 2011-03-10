class AddAlturaToUsuario < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :altura, :float
  end

  def self.down
    remove_column :usuarios, :altura
  end
end

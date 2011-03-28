class MarcaEmpresa < ActiveRecord::Migration
  def self.up
    add_column :marcas, :empresa, :string
  end

  def self.down
    remove_column :marcas, :empresa
  end
end

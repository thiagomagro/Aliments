class MarcaTelefone < ActiveRecord::Migration
  def self.up
    add_column :marcas, :sac, :string
  end

  def self.down
    remove_column :marcas, :sac
  end
end

class AddPesoUnicoToUsuario < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :peso_id, :integer
  end

  def self.down
    remove_column :usuarios, :peso_id
  end
end

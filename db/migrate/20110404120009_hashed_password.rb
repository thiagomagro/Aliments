class HashedPassword < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :senha_segura, :string
  end

  def self.down
    remove_column :usuarios, :senha_segura
  end
end

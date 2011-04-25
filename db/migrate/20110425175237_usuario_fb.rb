class UsuarioFb < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :fb_id, :bigint
  end

  def self.down
    remove_column :usuarios,:fb_id
  end
end

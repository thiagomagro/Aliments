class FbUser < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :fb_id, :bigint
    add_column :usuarios, :fb_login, :string
  end

  def self.down
    remove_column :usuarios,:fb_id
    remove_column :usuarios,:fb_login
  end
end

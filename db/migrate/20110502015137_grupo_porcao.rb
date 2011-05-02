class GrupoPorcao < ActiveRecord::Migration
  def self.up
    add_column :grupos, :porcao, :decimal
  end

  def self.down
    remove_column :grupos, :porcao
  end
end

class DeltaAlimentos < ActiveRecord::Migration
  def self.up
    add_column :alimentos, :delta, :boolean
    add_column :alimento_usdas, :delta, :boolean
  end

  def self.down
    remove_column :alimentos, :delta, :boolean
    remove_column :alimentos_usdas, :delta, :boolean
  end
end


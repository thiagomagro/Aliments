class CreateAlimentoTags < ActiveRecord::Migration
  def self.up
    create_table :alimento_tags do |t|
      t.string :nome
      t.references :alimento

      t.timestamps
    end
  end

  def self.down
    drop_table :alimento_tags
  end
end

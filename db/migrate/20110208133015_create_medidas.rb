class CreateMedidas < ActiveRecord::Migration
  def self.up
    create_table :medidas do |t|
      t.float :correlacao
      t.string :nome
      t.string :unidade

      t.timestamps
    end
    execute "SELECT setval('medidas_id_seq', 3532, true);"

  end

  def self.down
    drop_table :medidas
  end
end


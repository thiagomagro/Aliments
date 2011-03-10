class FloatToDecimal < ActiveRecord::Migration
  def self.up
    change_table :medidas do |t|
      t.change :correlacao, :decimal
    end
    change_table :componente_alimentos do |t|
      t.change :quantidade, :decimal
      t.change :porcao, :decimal
    end
    change_table :alimentos do |t|
      t.change :porcao, :decimal
    end
    change_table :alimento_medidas do |t|
      t.change :quantidade, :decimal
    end
    change_table :grupo_alimentos do |t|
      t.change :porcentagem, :decimal
    end
    change_table :componente_usda_alimentos do |t|
      t.change :quantidade, :decimal
    end
    change_table :pesos do |t|
      t.change :peso, :decimal
    end
    change_table :usuarios do |t|
      t.change :altura, :decimal
    end
  end

  def self.down
    change_table :medidas do |t|
      t.change :correlacao, :float
    end
    change_table :componente_alimentos do |t|
      t.change :quantidade, :float
      t.change :porcao, :float
    end
    change_table :alimentos do |t|
      t.change :porcao, :float
    end
    change_table :alimento_medidas do |t|
      t.change :quantidade, :float
    end
    change_table :grupo_alimentos do |t|
      t.change :porcentagem, :float
    end    
    change_table :componente_usda_alimentos do |t|
      t.change :quantidade, :float
    end
    change_table :pesos do |t|
      t.change :peso, :float
    end
    change_table :usuarios do |t|
      t.change :altura, :float
    end
  end
end

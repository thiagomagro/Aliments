class DatetimeToRefeicao < ActiveRecord::Migration
  def self.up
    change_table :refeicaos do |t|
      t.change :data, :datetime
    end
  end

  def self.down
    change_table :refeicaos do |t|
      t.change :data, :date
    end    
  end
end

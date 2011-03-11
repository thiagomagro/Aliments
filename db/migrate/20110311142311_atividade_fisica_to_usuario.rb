class AtividadeFisicaToUsuario < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :atividade_fisica, :integer
  end

  def self.down
    remove_column :usuarios, :atividade_fisica
  end
end

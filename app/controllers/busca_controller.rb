class BuscaController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate
  before_filter :admin_auth, :except => [:index]
  
  def index
    @busca = params["busca_string"]
    @usuarios = Sunspot.search(Usuario) do
        keywords params["busca_string"],:fields => [:nome]
        without(:id,usuario_logged.id)
    end
    @alimentos = Sunspot.search(Alimento) do
        keywords params["busca_string"],:fields => [:nome]
    end
  end
end

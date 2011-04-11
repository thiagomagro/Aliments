class HomeController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate, :except => [:index]
  before_filter :admin_auth, :except => [:index]

  def index
  end

end


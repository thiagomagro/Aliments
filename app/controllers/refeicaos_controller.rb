class RefeicaosController < ApplicationController
  def new
    @refeicao = Refeicao.new
  end
  
  def create
    @refeicao = Refeicao.new(params[:refeicao])
  end
end

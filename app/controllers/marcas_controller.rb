class MarcasController < ApplicationController
  before_filter :authenticate

  def show
    @marcas = Marca.all
  end

  def new
    @marca = Marca.new
  end

  def create
    @marca = Marca.new(params[:marca])

    respond_to do |format|
      if @marca.save
        format.html { redirect_to(@marca, :notice => 'Marca was successfully created.') }
        format.xml  { render :xml => @marca, :status => :created, :location => @marca }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marca.errors, :status => :unprocessable_entity }
      end
    end
  end
end

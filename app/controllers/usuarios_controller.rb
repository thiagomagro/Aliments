class UsuariosController < ApplicationController
  include ApplicationHelper
  include UsuariosHelper
  
  before_filter :authenticate, :except => [:new,:create]
  # GET /usuarios
  # GET /usuarios.xml
  def index
    @usuarios = Usuario.all
    
    #I18n.locale = "pt-BR"
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end
  
  # GET /usuarios/1
  # GET /usuarios/1.xml
  def show
    @usuario = Usuario.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end
  end
  
  # GET /usuarios/new
  # GET /usuarios/new.xml
  def new
    @usuario = Usuario.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usuario }
    end
  end
  
  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end
  
  # POST /usuarios
  # POST /usuarios.xml
  def create
    @usuario = Usuario.new(params[:usuario])
    @usuario.perfil = Perfil.where("nome=?","Usuário").first if @usuario.perfil.nil?
    #if @usuario.senha_flag.blank?
      @usuario.senha_segura = encrypt(@usuario.senha_flag,nil)
      #end
    if params[:peso_novo]
      if @usuario.peso.nil? || params[:peso_novo].to_f != @usuario.peso.peso
        @usuario.pesos << Peso.new(:data=>@usuario.peso.data,:peso=>@usuario.peso.peso) unless (@usuario.peso.nil? || params[:peso_novo].to_f == @usuario.peso.peso)
        # @usuario.peso.create(:peso=>params[:peso_novo],:data=>Date.current,:usuario=>@usuario)
        @usuario.peso = Peso.new(:peso=>params[:peso_novo],:data=>Date.current)
      end
    end
    
    respond_to do |format|
      if @usuario.save
        flash[:success] = "Cadastro efetuado com sucesso, bem-vindo à Aliments"
        flash[:subtitle] = "Para iniciar efetue o login"
        format.html { redirect_to(@usuario, :notice => 'Usuario was successfully created.') }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        flash[:error] = "Não foi possível efetuar seu cadastro."
        flash[:subtitle] = "Verifique os erros e tente novamente"
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /usuarios/1
  # PUT /usuarios/1.xml
  def update
    @usuario = Usuario.find(params[:id])
    usuario_temp = Usuario.new(params[:usuario])
    
    if !usuario_temp.senha_atual.blank?
      @usuario.atualizar_senha = true
      if @usuario.senha_segura != encrypt(usuario_temp.senha_atual,nil)
        @usuario.errors.add :senha_atual, "Senha inválida"
        flash[:error] = "Senha inválida"
        render :action => "edit"
        return
      end
      @usuario.senha_segura = encrypt(usuario_temp.senha_flag,nil)
    end
    
    if params[:peso_novo]
      if @usuario.peso.nil? || params[:peso_novo].to_f != @usuario.peso.peso
        @usuario.pesos << Peso.new(:usuario=>@usuario,:data=>@usuario.peso.data,:peso=>@usuario.peso.peso) unless (@usuario.peso.nil? || params[:peso_novo].to_f == @usuario.peso.peso)
        # @usuario.peso.create(:peso=>params[:peso_novo],:data=>Date.current,:usuario=>@usuario)
        @usuario.peso = Peso.new(:peso=>params[:peso_novo],:data=>Date.current,:usuario=>@usuario)
        
      end
    end
    #UsuarioMailer.cadastro_ok(@usuario).deliver
    respond_to do |format|
      if @usuario.update_attributes(params[:usuario].reject{|k,v| v.blank?})
        flash[:success] = "Dados atualizados com sucesso"
        format.html { redirect_to(@usuario, :notice => 'Usuario was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:error] = "Erro ao atualizar dados"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    
    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end
  
  def lugares
    if(params[:id])
      @usuario = Usuario.find(params[:id])
    else
      @usuario = usuario_logged
    end
  end
  
  
  def update_lugares
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      render "lugares"
    else
      render "lugares"
    end
    
  end
end


class ExistenciasController < ApplicationController
  auto_complete_for :activo, :descripcion

  # GET /existencias
  # GET /existencias.xml
  def index
    @existencias = Existencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @existencias }
    end
  end

  # GET /existencias/1
  # GET /existencias/1.xml
  def show
    @existencia = Existencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @existencia }
    end
  end

  # GET /existencias/new
  # GET /existencias/new.xml
  def new
    @activos = Activo.find(:all)
    @factura = Factura.find(:first, :conditions => ["id = ?", params[:id]])
    @existencias = Existencia.find(:all, :conditions => ["factura_id = ?", params[:id]])
    @existencia = Existencia.new
    @existencia.factura_id = @factura.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @existencia }
    end
  end

  # GET /existencias/1/edit
  def edit
    @existencia = Existencia.find(params[:id])
  end

  # POST /existencias
  # POST /existencias.xml
  def create
    @existencia = Existencia.new(params[:existencia])
    @activo = Activo.find(:first, :conditions => ["id = ?", @existencia.activo_id])
    if (@activo.es_equipo)
      @existencia.serial = params[:atributo]
      @existencia.cantidad = 1
      @existencia.saldo = 1
    else
      @existencia.cantidad = params[:atributo]
      @existencia.saldo = @existencia.cantidad
    end
    @existencia.save
    @existencia = Existencia.new
    @existencia.factura_id = Existencia.new(params[:existencia]).factura_id
    @existencias = Existencia.find(:all, :conditions => ["factura_id = ?", @existencia.factura_id])
    
    render :partial => "linea_existencia"
  end

  # PUT /existencias/1
  # PUT /existencias/1.xml
  def update
    @existencia = Existencia.find(params[:id])

    respond_to do |format|
      if @existencia.update_attributes(params[:existencia])
        format.html { redirect_to(@existencia, :notice => 'Existencia was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @existencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /existencias/1
  # DELETE /existencias/1.xml
  def destroy
    @existencia = Existencia.find(params[:id])
    @existencia.destroy

    respond_to do |format|
      format.html { redirect_to(existencias_url) }
      format.xml  { head :ok }
    end
  end

  def procesar
    #procesar la factura y activar todos los registros de existencia
    @factura = Factura.find(:first, :conditions => ["id = ?", params[:id]])
    @factura.estado = 'procesada'
    @factura.save
    Existencia.update_all("esta_activo = true", "factura_id = #{params[:id]}")
    redirect_to :factura, :notice => "Factura Procesada con éxito!"
  end
end

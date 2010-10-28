class LineasAsignadosController < ApplicationController
  # GET /lineas_asignados
  # GET /lineas_asignados.xml
  def index
    @lineas_asignados = LineasAsignado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lineas_asignados }
    end
  end

  # GET /lineas_asignados/1
  # GET /lineas_asignados/1.xml
  def show
    @lineas_asignado = LineasAsignado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lineas_asignado }
    end
  end

  # GET /lineas_asignados/new
  # GET /lineas_asignados/new.xml
  def new
    @linea_asignado = LineasAsignado.new
    @asignado = Asignado.find(:first, :conditions => ["id = ?", params[:id]])
    @asignados = LineasAsignado.find(:all, :conditions => ["asignado_id = ?", params[:id]])
    @linea_asignado.asignado_id = @asignado.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lineas_asignado }
    end
  end

  # GET /lineas_asignados/1/edit
  def edit
    @lineas_asignado = LineasAsignado.find(params[:id])
  end

  # POST /lineas_asignados
  # POST /lineas_asignados.xml
  def create
    @lineas_asignado = LineasAsignado.new(params[:lineas_asignado])
    @lineas_asignado.esta_activo = true
    @lineas_asignado.save
    # Actualizar la existencia a  asignado true
    @existencia = Existencia.find(@lineas_asignado.existencia_id)
    @existencia.update_attribute(:es_asignado, true)
    @linea_asignado = LineasAsignado.new
    @linea_asignado.asignado_id = @lineas_asignado.asignado_id
    @asignados = LineasAsignado.find(:all, :conditions=>["asignado_id = ?", @linea_asignado.asignado_id])

    render :partial => "linea_asignado"
  end

  # PUT /lineas_asignados/1
  # PUT /lineas_asignados/1.xml
  def update
    @lineas_asignado = LineasAsignado.find(params[:id])

    respond_to do |format|
      if @lineas_asignado.update_attributes(params[:lineas_asignado])
        format.html { redirect_to(@lineas_asignado, :notice => 'LineasAsignado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lineas_asignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lineas_asignados/1
  # DELETE /lineas_asignados/1.xml
  def destroy
    @lineas_asignado = LineasAsignado.find(params[:id])
    @lineas_asignado.destroy
    @asignados = LineasAsignado.find(:all, :conditions => ["asignado_id = ?", @lineas_asignado.asignado_id])

    render :partial => "linea_asignado"
  end
end

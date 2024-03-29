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
    #Instancio el obejto con los datos colectados del formulario
    @lineas_asignado = LineasAsignado.new(params[:lineas_asignado])

    #Instancio un objeto nuevo para ser enviado al formulario y asigno el id del documento de asignación
    @linea_asignado = LineasAsignado.new
    @linea_asignado.asignado_id = @lineas_asignado.asignado_id


    #Verifico si realmente se ha elegido un activo para ser asignado
    if (@lineas_asignado.existencia_id.blank?)
      @mensaje =  "No ha elegido un activo para ser asignado"
      render :partial => "linea_asignado"
    else
      @lineas_asignado.esta_activo = true
      @lineas_asignado.save
      @existencia = Existencia.find(:first, :conditions => ["id = ?", @lineas_asignado.existencia_id])
      @existencia.update_attribute(:es_asignado, true)
      #Busco todos lo registros asociados a la asignación actual
      @asignados = LineasAsignado.find(:all, :conditions=>["asignado_id = ?", @linea_asignado.asignado_id])
      render :partial => "linea_asignado"
    end
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
    @existencia = Existencia.find(@lineas_asignado.existencia_id)
    @existencia.update_attribute(:es_asignado, false)
    @asignados = LineasAsignado.find(:all, :conditions => ["asignado_id = ?", @lineas_asignado.asignado_id])

    render :partial => "linea_asignado"
  end

  def procesar
    #procesar el documento de asignación y activar todos los registros de existencias a asignados
    @asignado = Asignado.find(:first, :conditions => ["id = ?", params[:id]])
    @asignado.update_attribute(:esta_activo, true)
    redirect_to :asignado, :notice => "Asignación Procesada con Éxito!"
  end

  def new_desasignados
    #Localizo el registro de desasignación
    @desasignado = Desasignado.find(:first, :conditions => ["id = ?", params[:id]])
    @asignados = LineasAsignado.find(:all, :conditions => ["asignado_id = ?", @desasignado.asignado_id])
#    @linea_asignado = LineasAsignado.new
#    @linea_asignado.asignado_id = @desasignado.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lineas_asignado }
    end
  end

  #def revocar
#    @mensaje =  "Activo revocado de la asignación"
#    @asignados = LineasAsignado.find(:all, :conditions => ["asignado_id = ?",params[:id]])
#    render :partial => "linea_desasignado"
#  end

  def revocar
    flash[:notice] = "Revocado el activo #{params[:revocados_ids]}"
    #render :partial => "linea_desasignado"
    redirect_to asignados_path
    #LineasAsignado.update_all(["esta_activo=?", false], :id => params[:revocados_ids])
    #LineasAsignado.update_all(["desasignado_id=?", params[:id_desasignado]], :id => params[:revocados_ids])
  end
end

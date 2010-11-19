class LineasDespachosController < ApplicationController
  # GET /lineas_despachos
  # GET /lineas_despachos.xml
  def index
    @lineas_despachos = LineasDespacho.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lineas_despachos }
    end
  end

  # GET /lineas_despachos/1
  # GET /lineas_despachos/1.xml
  def show
    @lineas_despacho = LineasDespacho.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lineas_despacho }
    end
  end

  # GET /lineas_despachos/new
  # GET /lineas_despachos/new.xml
  def new
    @linea_despacho = LineasDespacho.new
    @despacho = Despacho.find(:first, :conditions => ["id = ?", params[:id]])
    @despachos = LineasDespacho.find(:all, :conditions=>["despacho_id = ?", params[:id]])
    @linea_despacho.despacho_id = @despacho.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lineas_despacho }
    end
  end

  # GET /lineas_despachos/1/edit
  def edit
    @lineas_despacho = LineasDespacho.find(params[:id])
  end

  # POST /lineas_despachos
  # POST /lineas_despachos.xml
  def create
    #Instancio el obejto con los datos colectados del formulario
    @lineas_despacho = LineasDespacho.new(params[:lineas_despacho])

    #Instancio un objeto nuevo para ser enviado al formulario y asigno el id del documento de asignación
    @linea_despacho = LineasDespacho.new
    @linea_despacho.despacho_id = @lineas_despacho.despacho_id


    #Verifico si realmente se ha elegido un activo para ser asignado
    if (@lineas_despacho.existencia_id.blank?)
      @mensaje =  "No ha elegido un producto para ser despachado"
      #Busco todos lo registros asociados a la asignación actual
      @despachos = LineasDespacho.find(:all, :conditions=>["despacho_id = ?", @linea_despacho.despacho_id])
      render :partial => "linea_despacho"
    else
      # Verifico si la cantidad a ser despachada no es mayor a la diponible
      if (@lineas_despacho.cantidad <= (Existencia.find(:first, :conditions => ["id = ?", @lineas_despacho.existencia_id])).saldo)
        @lineas_despacho.esta_activo = true
        @lineas_despacho.save
        @existencia = Existencia.find(:first, :conditions => ["id = ?", @lineas_despacho.existencia_id])
        @existencia.update_attribute(:cantidad, (@existencia.saldo - @lineas_despacho.cantidad))
        #Busco todos lo registros asociados a la asignación actual
        @despachos = LineasDespacho.find(:all, :conditions=>["despacho_id = ?", @linea_despacho.despacho_id])
        render :partial => "linea_despacho"
      else
        @mensaje = "La cantidad solicitada es mayor a la disponible en existencia"
        #Busco todos lo registros asociados a la asignación actual
        @despachos = LineasDespacho.find(:all, :conditions=>["despacho_id = ?", @linea_despacho.despacho_id])
        render :partial => "linea_despacho"
      end
    end

#    respond_to do |format|
#      if @lineas_despacho.save
#        format.html { redirect_to(@lineas_despacho, :notice => 'LineasDespacho was successfully created.') }
#        format.xml  { render :xml => @lineas_despacho, :status => :created, :location => @lineas_despacho }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @lineas_despacho.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # PUT /lineas_despachos/1
  # PUT /lineas_despachos/1.xml
  def update
    @lineas_despacho = LineasDespacho.find(params[:id])

    respond_to do |format|
      if @lineas_despacho.update_attributes(params[:lineas_despacho])
        format.html { redirect_to(@lineas_despacho, :notice => 'LineasDespacho was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lineas_despacho.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lineas_despachos/1
  # DELETE /lineas_despachos/1.xml
  def destroy
    @lineas_despacho = LineasDespacho.find(params[:id])
    @lineas_despacho.destroy

    respond_to do |format|
      format.html { redirect_to(lineas_despachos_url) }
      format.xml  { head :ok }
    end
  end
end

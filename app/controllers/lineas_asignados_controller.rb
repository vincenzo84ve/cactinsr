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
    @lineas_asignados = Asignado.find(:all, :conditions => ["id = ?", params[:id]])
    @asignado = Asignado.find(:first, :conditions => ["id = ?", params[:id]])
    @asignados = LineasAsignado.find(:all, :conditions => ["asignado_id = ?", params[:id]])

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
    @lineas_asignado = LineasAsignado.find(:all, :conditions => ["asignado_id = ?", param[:asignado_id]])

    respond_to do |format|
      if @lineas_asignado.save
        format.html { redirect_to(@lineas_asignado, :notice => 'LineasAsignado was successfully created.') }
        format.xml  { render :xml => @lineas_asignado, :status => :created, :location => @lineas_asignado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lineas_asignado.errors, :status => :unprocessable_entity }
      end
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

    respond_to do |format|
      format.html { redirect_to(lineas_asignados_url) }
      format.xml  { head :ok }
    end
  end
end

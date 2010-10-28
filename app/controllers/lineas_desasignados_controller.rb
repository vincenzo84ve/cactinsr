class LineasDesasignadosController < ApplicationController
  # GET /lineas_desasignados
  # GET /lineas_desasignados.xml
  def index
    @lineas_desasignados = LineasDesasignado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lineas_desasignados }
    end
  end

  # GET /lineas_desasignados/1
  # GET /lineas_desasignados/1.xml
  def show
    @lineas_desasignado = LineasDesasignado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lineas_desasignado }
    end
  end

  # GET /lineas_desasignados/new
  # GET /lineas_desasignados/new.xml
  def new
    @lineas_desasignado = LineasDesasignado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lineas_desasignado }
    end
  end

  # GET /lineas_desasignados/1/edit
  def edit
    @lineas_desasignado = LineasDesasignado.find(params[:id])
  end

  # POST /lineas_desasignados
  # POST /lineas_desasignados.xml
  def create
    @lineas_desasignado = LineasDesasignado.new(params[:lineas_desasignado])

    respond_to do |format|
      if @lineas_desasignado.save
        format.html { redirect_to(@lineas_desasignado, :notice => 'LineasDesasignado was successfully created.') }
        format.xml  { render :xml => @lineas_desasignado, :status => :created, :location => @lineas_desasignado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lineas_desasignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lineas_desasignados/1
  # PUT /lineas_desasignados/1.xml
  def update
    @lineas_desasignado = LineasDesasignado.find(params[:id])

    respond_to do |format|
      if @lineas_desasignado.update_attributes(params[:lineas_desasignado])
        format.html { redirect_to(@lineas_desasignado, :notice => 'LineasDesasignado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lineas_desasignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lineas_desasignados/1
  # DELETE /lineas_desasignados/1.xml
  def destroy
    @lineas_desasignado = LineasDesasignado.find(params[:id])
    @lineas_desasignado.destroy

    respond_to do |format|
      format.html { redirect_to(lineas_desasignados_url) }
      format.xml  { head :ok }
    end
  end
end

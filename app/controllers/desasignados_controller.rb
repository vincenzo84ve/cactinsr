class DesasignadosController < ApplicationController
  # GET /desasignados
  # GET /desasignados.xml
  def index
    @desasignados = Desasignado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @desasignados }
    end
  end

  # GET /desasignados/1
  # GET /desasignados/1.xml
  def show
    @desasignado = Desasignado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @desasignado }
    end
  end

  # GET /desasignados/new
  # GET /desasignados/new.xml
  def new
    @motivos = Motivo.find(:all)
    @desasignado = Desasignado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @desasignado }
    end
  end

  # GET /desasignados/1/edit
  def edit
    @desasignado = Desasignado.find(params[:id])
  end

  # POST /desasignados
  # POST /desasignados.xml
  def create
    @desasignado = Desasignado.new(params[:desasignado])

    respond_to do |format|
      if @desasignado.save
        format.html { redirect_to(@desasignado, :notice => 'Desasignado was successfully created.') }
        format.xml  { render :xml => @desasignado, :status => :created, :location => @desasignado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @desasignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /desasignados/1
  # PUT /desasignados/1.xml
  def update
    @desasignado = Desasignado.find(params[:id])

    respond_to do |format|
      if @desasignado.update_attributes(params[:desasignado])
        format.html { redirect_to(@desasignado, :notice => 'Desasignado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @desasignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /desasignados/1
  # DELETE /desasignados/1.xml
  def destroy
    @desasignado = Desasignado.find(params[:id])
    @desasignado.destroy

    respond_to do |format|
      format.html { redirect_to(desasignados_url) }
      format.xml  { head :ok }
    end
  end
end

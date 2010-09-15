class AsignadosController < ApplicationController
  # GET /asignados
  # GET /asignados.xml
  def index
    @asignados = Asignado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asignados }
    end
  end

  # GET /asignados/1
  # GET /asignados/1.xml
  def show
    @asignado = Asignado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asignado }
    end
  end

  # GET /asignados/new
  # GET /asignados/new.xml
  def new
    @asignado = Asignado.new
    @personas = Persona.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asignado }
    end
  end

  # GET /asignados/1/edit
  def edit
    @asignado = Asignado.find(params[:id])
  end

  # POST /asignados
  # POST /asignados.xml
  def create
    @asignado = Asignado.new(params[:asignado])

    respond_to do |format|
      if @asignado.save
        format.html { redirect_to(@asignado, :notice => 'Asignado was successfully created.') }
        format.xml  { render :xml => @asignado, :status => :created, :location => @asignado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asignados/1
  # PUT /asignados/1.xml
  def update
    @asignado = Asignado.find(params[:id])

    respond_to do |format|
      if @asignado.update_attributes(params[:asignado])
        format.html { redirect_to(@asignado, :notice => 'Asignado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asignado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asignados/1
  # DELETE /asignados/1.xml
  def destroy
    @asignado = Asignado.find(params[:id])
    @asignado.destroy

    respond_to do |format|
      format.html { redirect_to(asignados_url) }
      format.xml  { head :ok }
    end
  end
end

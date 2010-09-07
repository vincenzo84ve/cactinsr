class UbicacionesController < ApplicationController
  # GET /ubicaciones
  # GET /ubicaciones.xml
  def index
    @ubicaciones = Ubicacione.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ubicaciones }
    end
  end

  # GET /ubicaciones/1
  # GET /ubicaciones/1.xml
  def show
    @ubicacione = Ubicacione.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ubicacione }
    end
  end

  # GET /ubicaciones/new
  # GET /ubicaciones/new.xml
  def new
    @ubicacione = Ubicacione.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ubicacione }
    end
  end

  # GET /ubicaciones/1/edit
  def edit
    @ubicacione = Ubicacione.find(params[:id])
  end

  # POST /ubicaciones
  # POST /ubicaciones.xml
  def create
    @ubicacione = Ubicacione.new(params[:ubicacione])

    respond_to do |format|
      if @ubicacione.save
        format.html { redirect_to(@ubicacione, :notice => 'Ubicacione was successfully created.') }
        format.xml  { render :xml => @ubicacione, :status => :created, :location => @ubicacione }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ubicacione.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ubicaciones/1
  # PUT /ubicaciones/1.xml
  def update
    @ubicacione = Ubicacione.find(params[:id])

    respond_to do |format|
      if @ubicacione.update_attributes(params[:ubicacione])
        format.html { redirect_to(@ubicacione, :notice => 'Ubicacione was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ubicacione.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicaciones/1
  # DELETE /ubicaciones/1.xml
  def destroy
    @ubicacione = Ubicacione.find(params[:id])
    @ubicacione.destroy

    respond_to do |format|
      format.html { redirect_to(ubicaciones_url) }
      format.xml  { head :ok }
    end
  end
end

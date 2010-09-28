class DespachosController < ApplicationController
  # GET /despachos
  # GET /despachos.xml
  def index
    @despachos = Despacho.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @despachos }
    end
  end

  # GET /despachos/1
  # GET /despachos/1.xml
  def show
    @despacho = Despacho.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @despacho }
    end
  end

  # GET /despachos/new
  # GET /despachos/new.xml
  def new
    @despacho = Despacho.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @despacho }
    end
  end

  # GET /despachos/1/edit
  def edit
    @despacho = Despacho.find(params[:id])
  end

  # POST /despachos
  # POST /despachos.xml
  def create
    @despacho = Despacho.new(params[:despacho])

    respond_to do |format|
      if @despacho.save
        format.html { redirect_to(@despacho, :notice => 'Despacho was successfully created.') }
        format.xml  { render :xml => @despacho, :status => :created, :location => @despacho }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @despacho.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /despachos/1
  # PUT /despachos/1.xml
  def update
    @despacho = Despacho.find(params[:id])

    respond_to do |format|
      if @despacho.update_attributes(params[:despacho])
        format.html { redirect_to(@despacho, :notice => 'Despacho was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @despacho.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /despachos/1
  # DELETE /despachos/1.xml
  def destroy
    @despacho = Despacho.find(params[:id])
    @despacho.destroy

    respond_to do |format|
      format.html { redirect_to(despachos_url) }
      format.xml  { head :ok }
    end
  end
end

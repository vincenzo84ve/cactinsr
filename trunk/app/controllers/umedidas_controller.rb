class UmedidasController < ApplicationController
  # GET /umedidas
  # GET /umedidas.xml
  def index
    @umedidas = Umedida.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @umedidas }
    end
  end

  # GET /umedidas/1
  # GET /umedidas/1.xml
  def show
    @umedida = Umedida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @umedida }
    end
  end

  # GET /umedidas/new
  # GET /umedidas/new.xml
  def new
    @umedida = Umedida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @umedida }
    end
  end

  # GET /umedidas/1/edit
  def edit
    @umedida = Umedida.find(params[:id])
  end

  # POST /umedidas
  # POST /umedidas.xml
  def create
    @umedida = Umedida.new(params[:umedida])

    respond_to do |format|
      if @umedida.save
        format.html { redirect_to(@umedida, :notice => 'Umedida was successfully created.') }
        format.xml  { render :xml => @umedida, :status => :created, :location => @umedida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @umedida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /umedidas/1
  # PUT /umedidas/1.xml
  def update
    @umedida = Umedida.find(params[:id])

    respond_to do |format|
      if @umedida.update_attributes(params[:umedida])
        format.html { redirect_to(@umedida, :notice => 'Umedida was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @umedida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /umedidas/1
  # DELETE /umedidas/1.xml
  def destroy
    @umedida = Umedida.find(params[:id])
    @umedida.destroy

    respond_to do |format|
      format.html { redirect_to(umedidas_url) }
      format.xml  { head :ok }
    end
  end
end

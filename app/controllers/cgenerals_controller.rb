class CgeneralsController < ApplicationController
  # GET /cgenerals
  # GET /cgenerals.xml
  def index
    @cgenerals = Cgeneral.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cgenerals }
    end
  end

  # GET /cgenerals/1
  # GET /cgenerals/1.xml
  def show
    @cgeneral = Cgeneral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cgeneral }
    end
  end

  # GET /cgenerals/new
  # GET /cgenerals/new.xml
  def new
    @cgeneral = Cgeneral.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cgeneral }
    end
  end

  # GET /cgenerals/1/edit
  def edit
    @cgeneral = Cgeneral.find(params[:id])
  end

  # POST /cgenerals
  # POST /cgenerals.xml
  def create
    @cgeneral = Cgeneral.new(params[:cgeneral])

    respond_to do |format|
      if @cgeneral.save
        format.html { redirect_to(@cgeneral, :notice => 'Cgeneral was successfully created.') }
        format.xml  { render :xml => @cgeneral, :status => :created, :location => @cgeneral }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cgeneral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cgenerals/1
  # PUT /cgenerals/1.xml
  def update
    @cgeneral = Cgeneral.find(params[:id])

    respond_to do |format|
      if @cgeneral.update_attributes(params[:cgeneral])
        format.html { redirect_to(@cgeneral, :notice => 'Cgeneral was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cgeneral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cgenerals/1
  # DELETE /cgenerals/1.xml
  def destroy
    @cgeneral = Cgeneral.find(params[:id])
    @cgeneral.destroy

    respond_to do |format|
      format.html { redirect_to(cgenerals_url) }
      format.xml  { head :ok }
    end
  end
end

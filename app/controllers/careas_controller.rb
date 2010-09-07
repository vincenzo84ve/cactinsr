class CareasController < ApplicationController
  # GET /careas
  # GET /careas.xml
  def index
    @careas = Carea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @careas }
    end
  end

  # GET /careas/1
  # GET /careas/1.xml
  def show
    @carea = Carea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carea }
    end
  end

  # GET /careas/new
  # GET /careas/new.xml
  def new
    @carea = Carea.new
    @cgenerales = Cgeneral.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carea }
    end
  end

  # GET /careas/1/edit
  def edit
    @carea = Carea.find(params[:id])
    @cgenerales = Cgeneral.find(:all)
  end

  # POST /careas
  # POST /careas.xml
  def create
    @carea = Carea.new(params[:carea])

    respond_to do |format|
      if @carea.save
        format.html { redirect_to(@carea, :notice => 'Carea was successfully created.') }
        format.xml  { render :xml => @carea, :status => :created, :location => @carea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /careas/1
  # PUT /careas/1.xml
  def update
    @carea = Carea.find(params[:id])

    respond_to do |format|
      if @carea.update_attributes(params[:carea])
        format.html { redirect_to(@carea, :notice => 'Carea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /careas/1
  # DELETE /careas/1.xml
  def destroy
    @carea = Carea.find(params[:id])
    @carea.destroy

    respond_to do |format|
      format.html { redirect_to(careas_url) }
      format.xml  { head :ok }
    end
  end
end

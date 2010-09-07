class FichasController < ApplicationController
  auto_complete_for :ficha, :componente
  
  # GET /fichas
  # GET /fichas.xml
  def index
    @fichas = Ficha.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichas }
    end
  end

  # GET /fichas/1
  # GET /fichas/1.xml
  def show
    @ficha = Ficha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ficha }
    end
  end

  # GET /fichas/new
  # GET /fichas/new.xml
  def new
    @umedidas = Umedida.find(:all)
    @activo = Activo.find(:first, :conditions => ["id = ?", params[:id]])
    @fichas =  Ficha.find(:all, :conditions => ["activo_id = ?", @activo.id])
    @ficha = Ficha.new
    @ficha.activo_id = @activo.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ficha }
    end
  end

  # GET /fichas/1/edit
  def edit
    @ficha = Ficha.find(params[:id])
    @umedidas = Umedida.find(:all)
  end

  # POST /fichas
  # POST /fichas.xml
  def create
    @ficha = Ficha.new(params[:ficha])
    @ficha.save
    @umedidas = Umedida.find(:all)
    @fichas =  Ficha.find(:all, :conditions => ["activo_id = ?", @ficha.activo_id])
    @ficha = Ficha.new
    render(:partial => "lineas_ficha_tecnica")
  end

  # PUT /fichas/1
  # PUT /fichas/1.xml
  def update
    @ficha = Ficha.find(params[:id])

    respond_to do |format|
      if @ficha.update_attributes(params[:ficha])
        format.html { redirect_to(@ficha, :notice => 'Ficha was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichas/1
  # DELETE /fichas/1.xml
  def destroy
    @ficha = Ficha.find(params[:id])
    @ficha.destroy
    @umedidas = Umedida.find(:all)
    @fichas =  Ficha.find(:all, :conditions => ["activo_id = ?", @ficha.activo_id])
    @ficha = Ficha.new
    render(:partial => "lineas_ficha_tecnica")

    
  end
end

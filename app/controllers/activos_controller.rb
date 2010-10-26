class ActivosController < ApplicationController
  auto_complete_for :ficha, :componente
  
  # GET /activos
  # GET /activos.xml
  def index
    @activos = Activo.all
    @marcas = Marca.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activos }
    end
  end

  # GET /activos/1
  # GET /activos/1.xml
  def show
    @activo = Activo.find(params[:id])
    @fichas =  Ficha.find(:all, :conditions => ["activo_id = ?", @activo.id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activo }
    end
  end

  # GET /activos/new
  # GET /activos/new.xml
  def new
    @activo = Activo.new
    @marcas = Marca.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activo }
    end
  end

  # GET /activos/1/edit
  def edit
    @activo = Activo.find(params[:id])
    @marcas = Marca.find(:all)
    @umedidas = Umedida.find(:all)
    @fichas =  Ficha.find(:all, :conditions => ["activo_id = ?", @activo.id])
    @ficha = Ficha.new
    @ficha.activo_id = @activo.id
  end

  # POST /activos
  # POST /activos.xml
  def create
    @activo = Activo.new(params[:activo])
    @activo.save
    
    if @activo.es_equipo == true
      redirect_to(:controller => "fichas", :action => "new", :id => @activo)
    else
      respond_to do |format|
        if @activo.save
          format.html { redirect_to(@activo, :notice => 'Activo was successfully created.') }
          format.xml  { render :xml => @activo, :status => :created, :location => @activo }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @activo.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /activos/1
  # PUT /activos/1.xml
  def update
    @activo = Activo.find(params[:id])
    
    respond_to do |format|
      if @activo.update_attributes(params[:activo])
        format.html { redirect_to(@activo, :notice => 'Activo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activos/1
  # DELETE /activos/1.xml
  def destroy
    @activo = Activo.find(params[:id])
    @activo.destroy

    respond_to do |format|
      format.html { redirect_to(activos_url) }
      format.xml  { head :ok }
    end
  end

  def buscador_activos
    @resultados = Activo.find(:all)
    @activos = Activo.new
  end

  def buscador_activos_asg
    #@resultados = Activo.find(:all, :conditions => ["es_equipo = ? AND LOWER(descripcion) ilike ?", "t", "%#{params[:descripcion]}%"])
    @resultados = Activo.find_by_sql("SELECT existencias.id, activos.descripcion AS activo, marcas.descripcion AS marcas, activos.modelo, existencias.serial FROM activos, existencias, marcas WHERE (existencias.es_asignado = 'f' AND existencias.esta_activo = 't' AND existencias.activo_id = activos.id AND activos.es_equipo = 't' AND activos.marca_id = marcas.id) ORDER BY existencias.id ASC")
    @activos = Activo.new
  end

  def buscador
    #@resultados = Activo.find(:all, :conditions => ["descripcion = ?", params[:descripcion]])
    #@resultados = Activo.find_by_sql("SELECT * FROM activos WHERE descripcion ilike '%#{params[:descripcion]}%'")
    @resultados = Activo.find(:all, :conditions => ["LOWER(descripcion) ILIKE ?", "%#{params[:descripcion].downcase}%"])
    render(:partial => "lineas_buscador")
  end

  def buscador_asg
    #@resultados = Activo.find(:all, :conditions => ["es_equipo = ? AND LOWER(descripcion) ILIKE ?", "t", "%#{params[:descripcion].downcase}%"])
    @resultados = Activo.find_by_sql("SELECT existencias.id, activos.descripcion AS activo, marcas.descripcion AS marcas, activos.modelo, existencias.serial FROM activos, existencias, marcas WHERE (existencias.es_asignado = 'f' AND existencias.esta_activo = 't' AND existencias.activo_id = activos.id AND activos.es_equipo = 't' AND activos.marca_id = marcas.id AND LOWER(activos.descripcion) ilike '%#{params[:descripcion].downcase}%') ORDER BY existencias.id ASC")
    render(:partial => "lineas_buscador_asg")
  end
end

class FacturasController < ApplicationController
  # GET /facturas
  # GET /facturas.xml
  def index
    @facturas = Factura.paginate :page => (/[1-9]+/ === params[:page] ? params[:page] : 1), :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facturas }
    end
  end

  # GET /facturas/1
  # GET /facturas/1.xml
  def show
    @factura = Factura.find(params[:id])
    @existencias = Existencia.find(:all, :conditions => ["factura_id = ?", @factura.id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @factura }
    end
  end

  # GET /facturas/new
  # GET /facturas/new.xml
  def new
    @factura = Factura.new
    @proveedores = Proveedor.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @factura }
    end
  end

  # GET /facturas/1/edit
  def edit
    @factura = Factura.find(params[:id])
  end

  # POST /facturas
  # POST /facturas.xml
  def create
    @factura = Factura.new(params[:factura])
    @factura.save
    redirect_to existencia_url(:id => @factura.id)
    #redirect_to "existencias/new/#{@factura.id}"
    #redirect_to(:controller => "existencias", :action => "new/#{@factura.id}")
    #render_component :controller => "existencias", :action => "new"

    #render :partial => "existencias/new", :collection => @factura#, :locals => { :id = @factura }
  end

  # PUT /facturas/1
  # PUT /facturas/1.xml
  def update
    @factura = Factura.find(params[:id])

    respond_to do |format|
      if @factura.update_attributes(params[:factura])
        format.html { redirect_to(@factura, :notice => 'Factura was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @factura.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.xml
  def destroy
    @factura = Factura.find(params[:id])
    @factura.destroy

    respond_to do |format|
      format.html { redirect_to(facturas_url) }
      format.xml  { head :ok }
    end
  end

  def anular
    @factura = Factura.find(params[:id])
    if @factura.update_attribute("estado", "anulado")
      Existencia.update_all("esta_activo = false", "factura_id = #{params[:id]}")
      redirect_to(@factura, :notice => 'Factura anulada con éxito.')
    end
  end
end

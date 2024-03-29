class PersonasController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  # GET /personas
  # GET /personas.xml
  def index
    #@personas = Persona.all
    @personas = Persona.find(:all, :order => sort_column + ' ' + sort_direction)
    #@personas = Persona.order(params[:sort])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @personas }
    end
  end

  # GET /personas/1
  # GET /personas/1.xml
  def show
    @persona = Persona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @persona }
    end
  end

  # GET /personas/new
  # GET /personas/new.xml
  def new
    @persona = Persona.new
    @careas = Carea.find(:all)
    @ubicaciones = Ubicacione.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @persona }
    end
  end

  # GET /personas/1/edit
  def edit
    @persona = Persona.find(params[:id])
    @careas = Carea.find(:all)
    @ubicaciones = Ubicacione.find(:all)
  end

  # POST /personas
  # POST /personas.xml
  def create
    @persona = Persona.new(params[:persona])

    respond_to do |format|
      if @persona.save
        format.html { redirect_to(@persona, :notice => 'Persona was successfully created.') }
        format.xml  { render :xml => @persona, :status => :created, :location => @persona }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @persona.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personas/1
  # PUT /personas/1.xml
  def update
    @persona = Persona.find(params[:id])

    respond_to do |format|
      if @persona.update_attributes(params[:persona])
        format.html { redirect_to(@persona, :notice => 'Persona was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @persona.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.xml
  def destroy
    @persona = Persona.find(params[:id])
    @persona.destroy

    respond_to do |format|
      format.html { redirect_to(personas_url) }
      format.xml  { head :ok }
    end
  end

  private
  def sort_column
    #params[:sort] || "cedula"
    Persona.column_names.include?(params[:sort]) ? params[:sort] : "cedula"
  end

  def sort_direction
    #params[:direction] || "asc"
    %w[asc desc].include?(params[:direction]) ?  params[:direction].to_s : "asc"
  end  
end

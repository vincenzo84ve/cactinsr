require 'prawn'
Prawn::Document.generate('hello.pdf') do |pdf|
  #pdf.font "Helvetica"
  #pdf.font.size = 13
  pdf.text "Asignación: #{@asignado.id}", :size => 16, :style => :bold, :spacing => 4
  pdf.text "Fecha: #{@asignado.fecha}", :spacing => 16
  pdf.text "Persona: #{@asignado.persona.nombre_apellido}", :spacing => 16
  #pdf.text @book.description

  #pdf.font "Helvetica"
  #pdf.font.size = 13

  @asignados.each do |linea|
    pdf.text "Activo: #{linea.existencia.activo.descripcion}", :size => 16, :style => :bold, :spacing => 4
    pdf.text "Modelo: #{linea.existencia.activo.modelo}", :spacing => 16
    pdf.text "Serial: #{linea.existencia.serial}", :spacing => 16
    pdf.start_new_page
  end
end
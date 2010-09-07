class Proveedor < ActiveRecord::Base
  has_many :facturas
  
  validates_presence_of(:nombre, :message => "Debe especificar el nombre del proveedor")
  validates_presence_of(:rif, :message => "Debe especificar el RIF del proveedor")
  validates_format_of(:rif, :with => /^[Jj]-(\d\d\d\d\d\d\d\d)-[0-9]$/, :message => "Formato RIF inconrrecto")
  validates_presence_of(:telefono, :message => "Debe especificar el teléfono del proveedor")
  validates_presence_of(:contacto, :message => "Debe especificar el nombre de la persona contacto")
end

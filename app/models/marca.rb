class Marca < ActiveRecord::Base
  has_many :activos
  validates_presence_of(:descripcion, :message => "Debe especificar la descripción de la marca")
end

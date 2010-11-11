class Persona < ActiveRecord::Base
  belongs_to :carea
  belongs_to :ubicacione
  has_many :asignados
  has_many :despachos

  def nombre_apellido
    nombre + " " + apellido
  end
end

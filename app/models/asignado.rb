class Asignado < ActiveRecord::Base
  has_many :desasignados
  has_many :lineas_asignados
  belongs_to :persona
end

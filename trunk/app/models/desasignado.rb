class Desasignado < ActiveRecord::Base
  belongs_to :motivo
  belongs_to :asignado
end

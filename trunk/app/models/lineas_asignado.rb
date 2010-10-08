class LineasAsignado < ActiveRecord::Base
  belongs_to :asignado
  belongs_to :existencia
end

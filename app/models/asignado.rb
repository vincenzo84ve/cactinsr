class Asignado < ActiveRecord::Base
  belongs_to :existencia
  belongs_to :persona
end

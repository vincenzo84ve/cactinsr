class Persona < ActiveRecord::Base
  belongs_to :carea
  belongs_to :ubicacione
end

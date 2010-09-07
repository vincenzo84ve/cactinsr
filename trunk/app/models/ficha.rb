class Ficha < ActiveRecord::Base
  belongs_to :umedida
  belongs_to :activo
end

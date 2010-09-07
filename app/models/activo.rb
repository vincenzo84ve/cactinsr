class Activo < ActiveRecord::Base
  has_many :existencias
  has_many :fichas
  belongs_to :marca
end

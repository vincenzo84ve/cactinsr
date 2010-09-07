class Carea < ActiveRecord::Base
  has_many :personas
  belongs_to :cgeneral
end

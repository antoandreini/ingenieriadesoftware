class Pregunta < ActiveRecord::Base
  belongs_to :gauchada
  belongs_to :usuario
  validates :descripcion, presence: true
  validates_associated :usuario
  validates_associated :gauchada
end

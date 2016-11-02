class Gauchada < ActiveRecord::Base
  has_many :pregunta
  has_many :postulacions
  belongs_to :usuario
end

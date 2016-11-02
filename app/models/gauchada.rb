class Gauchada < ActiveRecord::Base
  has_many :pregunta
  has_many :postulaciones
  belongs_to :usuario
  has_attached_file :foto, styles: { small: "64x64", med: "100x100", large: "200x200" }
  default_scope -> { order :fecha }
end

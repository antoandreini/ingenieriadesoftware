class Gauchada < ActiveRecord::Base
  has_many :pregunta
<<<<<<< HEAD
  has_many :postulaciones
  belongs_to :usuario
  has_attached_file :foto, styles: { small: "64x64", med: "100x100", large: "200x200" }
  default_scope -> { order :fecha }
=======
  has_many :postulacions
  belongs_to :usuario
>>>>>>> 9d7bf3d232295e2188d07ee16e1159117379bd66
end

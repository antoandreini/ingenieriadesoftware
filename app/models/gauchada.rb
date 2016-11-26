class Gauchada < ActiveRecord::Base
  has_many :pregunta
  has_many :postulacions
  belongs_to :usuario
  validates_associated :usuario
  validates :titulo, presence: true
  validates :descripcion, presence: true
  validates :ubicacion, presence: true
 validates :imagen, format: { with: /.*/ }
  default_scope -> { order("created_at desc") }

def self.search(search)
  where("ubicacion ILIKE ? OR titulo ILIKE ? OR descripcion ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
end
end

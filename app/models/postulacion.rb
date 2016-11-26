class Postulacion < ActiveRecord::Base
  belongs_to :gauchada
  belongs_to :user
  validates :comentarios, presence: true  
end

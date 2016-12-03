class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :gauchadas
   has_many :preguntums
   has_many :postulacions
   has_many :preguntas
   has_many :pagos
   has_many :comentarios
end

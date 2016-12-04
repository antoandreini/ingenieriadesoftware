class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :gauchadas
   has_many :pregunta
   has_many :postulacions
   has_many :pagos
   def <=>(other)
    other.puntos_para_gauchadas <=> self.puntos_para_gauchadas
  end
end

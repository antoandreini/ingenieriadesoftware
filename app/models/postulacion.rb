class Postulacion < ActiveRecord::Base
  belongs_to :gauchada
  belongs_to :user
end

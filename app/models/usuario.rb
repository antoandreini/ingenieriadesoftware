class Usuario < ActiveRecord::Base
    has_many :gauchadas
    has_many :preguntums
    has_many :pagos
    has_many :comentarios
end

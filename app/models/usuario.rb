class Usuario < ActiveRecord::Base
    has_many :gauchadas
    has_many :pregunta
    has_many :pagos
end

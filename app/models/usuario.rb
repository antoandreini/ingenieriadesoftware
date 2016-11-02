class Usuario < ActiveRecord::Base
    has_many :gauchadas
    has_many :pregunta
    has_many :pagos
    has_attached_file :foto, styles: { small: "64x64", med: "100x100", large: "200x200" }
end

class Logro < ActiveRecord::Base
	validates :estado, presence: true, uniqueness: true
	validates :puntuacion, presence: true, uniqueness: true
	default_scope -> { order("puntuacion") }
end

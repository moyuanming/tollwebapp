class Gljdaima < ActiveRecord::Base
	has_many :tollstation, dependent: :destroy
	validates :name, length: { minimum: 2 }
	validates :no, length: { is: 2 }
end

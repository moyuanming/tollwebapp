class Pianqudaima < ActiveRecord::Base
	has_many :tollstation, dependent: :destroy
end

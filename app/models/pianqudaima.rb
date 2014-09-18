class Pianqudaima < ActiveRecord::Base	
	has_many :gljdaima, dependent: :destroy
end

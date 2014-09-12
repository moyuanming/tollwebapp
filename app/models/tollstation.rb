class Tollstation < ActiveRecord::Base
	belongs_to :pianqudaima
	belongs_to :gljdaima
	validates :name, length: { minimum: 2 }
	VALID_IP_REGEX  = /((?:(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d))))/i
	validates :oldip,  format: { with: VALID_IP_REGEX }
	validates :newip, presence: true, format: { with: VALID_IP_REGEX }

end
class Message < ActiveRecord::Base
	validates :username, 
		presence: true, 
		length: {minimum: 3, maximum: 60}
	validates_format_of :username, :with => /\A[a-zA-Z\-\_]*\z/
	validates :content, presence: true, length: {maximum: 160}
	validates :app_id, presence: true
end
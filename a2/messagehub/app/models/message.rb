class Message < ActiveRecord::Base
	validates :username, presence: true
	validates :content, presence: true
	validates :app_id, presence: true
end

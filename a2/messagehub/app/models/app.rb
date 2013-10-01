class App < ActiveRecord::Base
	validates :app_title, presence: true, length: {minimum: 1}
	validates :description, presence: true, length: {minimum: 1}
end

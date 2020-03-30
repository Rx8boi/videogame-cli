#videogame class
#holding game objects
#assign & all methods

class VideoGame

@@all = []

	attr_accessor :title, :status, :url



	def initialize(title, status = ("Coming Soon"), url)
		@title = title
		@url = url
		@status = status
		@@all << self

	end

	def self.all
		@@all
	end


def self.title
	puts self
end

end
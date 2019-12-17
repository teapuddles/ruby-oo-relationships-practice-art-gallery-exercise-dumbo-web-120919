require 'pry'
#artist -< galleries >- paintings
class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience

    @@all << self
  end
  
  def self.all
    @@all
  end

  def paintings
    # artist_paintings = []                  ______WAY WITH EACH
    # Painting.all.each do |painting_instance|
    #   if painting_instance.artist.name == self.name
    #     artist_paintings << painting_instance
    #   end
    # end
    # artist_paintings

    selected_paintings = Painting.all.select do |painting_instance| #WAY WITH SELECT
      painting_instance.artist.name == self.name
    end
    selected_paintings
    # Painting.all.select do |painting|      -cleaner
    # painting.artist == self
    #  end
  end

  # def galleries
  #   selected_galleries = Painting.all.select do |painting_instance|
  #     painting_instance.artist.name == self.name
  #   end
  #   selected_galleries
  # end
  def galleries
    paintings.map do |painting|
      painting.gallery
    end
  end
  #collect all of the galleries
  #see if that artist is in an instance of gallery
  #return an array with just those instances. 
  def cities
    galleries.map do |gallery|      
      gallery.city 
    end
  end

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end

  def self.total_experience 
    self.all.reduce(0) do |sum, artist|
      sum + artist.years_experience
    end
  end

  def self.most_prolific
    self.all.max_by do |artist_inst|
      artist_inst.years_experience / artist_inst.paintings.length
    end
  end

end 

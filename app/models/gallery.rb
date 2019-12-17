require 'pry'
class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city

    @@all << self
  end

  def paintings
    Painting.all.select do |painting_inst|
      painting_inst.gallery == self
    end
  end


  def artists
    paintings.map do |painting|
      painting.artist
    end
  end


  def artist_names
    artists.map do |artist|
      #binding.pry
      artist.name
    end
  end


  def most_expensive_painting
    paintings.max_by do |painting|
      painting.price
    end
  end

  
  def self.all
    @@all
  end


end

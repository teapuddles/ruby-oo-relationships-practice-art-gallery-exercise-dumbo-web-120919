require_relative '../config/environment.rb'

a1 = Artist.new("Picasso", 12)
a2 = Artist.new("Monet", 14)

g1 = Gallery.new("The Met", "NYC")
g2 = Gallery.new("Smithsonian", "DC")

p1 = Painting.new("Flowers", 100000, a1, g1)
p2 = Painting.new("Self Portrait", 203944, a2, g2)
p3 = Painting.new("T=rex", 29385, a1, g2)

binding.pry

puts "Bob Ross rules."

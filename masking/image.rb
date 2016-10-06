require 'rmagick'
require 'matrix'

class Magick::Image
  def *(mask)
    (0...self.rows).each do |i|
      (0...self.columns).each do |j|
        next if mask[i][j] == 1
        self.pixel_color(j, i, 'black')
      end
    end
  end
end

i = Magick::Image::read('1.jpg').first
matrix = Matrix.build(i.rows, i.columns) { rand.round }.to_a

i * matrix
i.write('2.jpg')

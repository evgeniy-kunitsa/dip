require 'rmagick'
require './pixel'

class Magick::Image
  def +(const)
    (0...rows).each do |i|
      (0...columns).each do |j|
        self_pixel = self.get_pixels(j, i, 1, 1).first
        result = self_pixel + const
        self.store_pixels(j, i, 1, 1, [result])
      end
    end
  end

  def *(const)
    (0...rows).each do |i|
      (0...columns).each do |j|
        self_pixel = self.get_pixels(j, i, 1, 1).first
        result = self_pixel * const
        self.store_pixels(j, i, 1, 1, [result])
      end
    end
  end
end

# USING:
# i = Magick::Image::read("1.jpg")[0]
# i + 12358
# i.write('2.jpg')
#
# i = Magick::Image::read("1.jpg")[0]
# i * 4
# i.write('3.jpg')

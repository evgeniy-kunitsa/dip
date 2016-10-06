require 'rmagick'
require './pixel'

class Magick::Image
  def +(other_image)
    self.each_pixel do |pixel, x, y|
      other_pixel = other_image.get_pixels(x, y, 1, 1).first
      result = pixel + other_pixel
      self.store_pixels(x, y, 1, 1, [result])
    end
  end

  def -(other_image)
    self.each_pixel do |pixel, x, y|
      other_pixel = other_image.get_pixels(x, y, 1, 1).first
      result = pixel - other_pixel
      self.store_pixels(x, y, 1, 1, [result])
    end
  end
end

# USING:
# i = Magick::Image::read("1.jpg").first
# i1 = Magick::Image::read("2.jpg").first
# i + i1
# i.write('3.jpg')
#
# i = Magick::Image::read("1.jpg").first
# i1 = Magick::Image::read("2.jpg").first
# i - i1
# i.write('4.jpg')

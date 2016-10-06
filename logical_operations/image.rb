require 'rmagick'
require './pixel'

class Magick::Image
  def |(other_image)
    rows = min_rows(other_image)
    columns = min_columns(other_image)
    (0...rows).each do |i|
      (0...columns).each do |j|
        self_pixel = self.get_pixels(j, i, 1, 1).first
        other_image_pixel = other_image.get_pixels(j, i, 1, 1).first
        result = self_pixel | other_image_pixel
        self.store_pixels(j, i, 1, 1, [result])
      end
    end
  end

  def &(other_image)
    rows = min_rows(other_image)
    columns = min_columns(other_image)
    (0...rows).each do |i|
      (0...columns).each do |j|
        self_pixel = self.get_pixels(j, i, 1, 1).first
        other_image_pixel = other_image.get_pixels(j, i, 1, 1).first
        result = self_pixel & other_image_pixel
        self.store_pixels(j, i, 1, 1, [result])
      end
    end
  end

  def ^(other_image)
    rows = min_rows(other_image)
    columns = min_columns(other_image)
    (0...rows).each do |i|
      (0...columns).each do |j|
        self_pixel = self.get_pixels(j, i, 1, 1).first
        other_image_pixel = other_image.get_pixels(j, i, 1, 1).first
        result = self_pixel ^ other_image_pixel
        self.store_pixels(j, i, 1, 1, [result])
      end
    end
  end

  def !
    (0...self.rows).each do |i|
      (0...self.columns).each do |j|
        self_pixel = self.get_pixels(j, i, 1, 1).first
        result = !self_pixel
        self.store_pixels(j, i, 1, 1, [result])
      end
    end
  end

  private

  def min_rows(other_image)
    self.rows < other_image.rows ? self.rows : other_image.rows
  end

  def min_columns(other_image)
    self.columns < other_image.columns ? self.columns : other_image.columns
  end
end

# USING:
# i = Magick::Image::read("1.png")[0]
# i1 = Magick::Image::read("2.png")[0]
# i | i1
# i.write('3.jpg')
# i = Magick::Image::read("1.png")[0]
# i & i1
# i.write('4.jpg')
# i = Magick::Image::read("1.png")[0]
# i ^ i1
# i.write('5.jpg')
# i = Magick::Image::read("1.png")[0]
# !i
# i.write('6.jpg')

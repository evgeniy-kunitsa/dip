require 'rmagick'
require 'matrix'

class Magick::Image
  def equalize
    h = build_histogram
    h = normalize_histogram(h)
    cumulative_h = cumulative_histogram(h)
    equalize_pixels(cumulative_h)
  end

  private

  def cumulative_histogram(h)
    values = h.values
    keys = h.keys
    h.each { |k, v| h[k] = (values[0...keys.index(k)].inject(0, :+)).to_i }
    h
  end

  def equalize_pixels(cumulative_h)
    cumulative_h.default = 0
    self.each_pixel do |pixel, x, y|
      b = cumulative_h[pixel.red / 256] * 256
      self.store_pixels(x, y, 1, 1, [Magick::Pixel.new(b, b, b, 0)])
    end
  end

  def normalize_histogram(histogram)
    pixels_count = (self.rows * self.columns).to_f
    histogram.each do |k, v|
      histogram[k] = v * 255 / pixels_count
    end
    histogram
  end

  def build_histogram
    pixels_values = []
    self.each_pixel do |pixel, col, row|
      pixels_values.push(pixel.red / 256)
    end
    pixels_values.group_by{ |v| v }.sort.map{ |k, v| [k, v.size] }.to_h
  end
end

# USING:
# i = Magick::Image::read('1.jpg').first
# i.equalize
# i.write('2.jpg')

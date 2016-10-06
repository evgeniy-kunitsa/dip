require 'rmagick'

class Magick::Image
  LUMINANCE_LEVELS = 256

  def luminance_slice(n = 4)
    wave = sawtoth_wave_generate(n)
    self.each_pixel do |pixel, x, y|
      r = wave[(pixel.red / 256) - 1] * 256
      g = wave[(pixel.green / 256) - 1] * 256
      b = wave[(pixel.blue / 256) - 1] * 256
      self.store_pixels(x, y, 1, 1, [Magick::Pixel.new(r, g, b, 0)])
    end
  end

  private

  def sawtoth_wave_generate(n)
    wave = []
    x = 0
    (0...LUMINANCE_LEVELS).each do |i|
      wave.push x
      x += n
      x = x % LUMINANCE_LEVELS
    end
    wave
  end
end

i = Magick::Image::read("1.jpg").first
i.luminance_slice(2)
i.write('2.jpg')

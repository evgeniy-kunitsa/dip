require 'rmagick'

class Magick::Image
  LUMINANCE_LEVELS = 65536

  def luminance_slice(n = 4)
    wave = sawtoth_wave_generate(n)
    self.each_pixel do |pixel, x, y|
      r = wave[pixel.red]
      g = wave[pixel.green]
      b = wave[pixel.blue]
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

# USING:
# i = Magick::Image::read("1.jpg").first
# i.luminance_slice(2)
# i.write('2.jpg')

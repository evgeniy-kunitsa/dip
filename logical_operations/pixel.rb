class Magick::Pixel
  def |(other_pixel)
    self.red = self.red | other_pixel.red
    self.blue = self.blue | other_pixel.blue
    self.green = self.green | other_pixel.green
    self
  end

  def &(other_pixel)
    self.red = self.red & other_pixel.red
    self.blue = self.blue & other_pixel.blue
    self.green = self.green & other_pixel.green
    self
  end

  def ^(other_pixel)
    self.red = self.red ^ other_pixel.red
    self.blue = self.blue ^ other_pixel.blue
    self.green = self.green ^ other_pixel.green
    self
  end

  def !
    self.red = 65535 - self.red
    self.blue = 65535 - self.blue
    self.green = 65535 - self.green
    self
  end
end

class Magick::Pixel
  A = 0.5

  def +(other_pixel)
    self.red = A*self.red + (1-A)*other_pixel.red
    self.blue = A*self.blue + (1-A)*other_pixel.blue
    self.green = A*self.green + (1-A)*other_pixel.green
    self
  end

  def -(other_pixel)
    if A*self.red - (1-A)*other_pixel.red < 0
      self.red = 0
    else
      self.red = A*self.red - (1-A)*other_pixel.red
    end

    if A*self.blue - (1-A)*other_pixel.blue < 0
      self.blue = 0
    else
      self.blue = A*self.blue - (1-A)*other_pixel.blue
    end

    if A*self.green - (1-A)*other_pixel.green < 0
      self.green = 0
    else
      self.green = A*self.green - (1-A)*other_pixel.green
    end
    self
  end
end

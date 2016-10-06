class Magick::Pixel
  def +(const)
    if self.red + const > 65535
      self.red = 65535
    elsif self.red + const < 0
      self.red = 0
    else
      self.red = self.red + const
    end

    if self.blue + const > 65535
      self.blue = 65535
    elsif self.blue + const < 0
      self.blue = 0
    else
      self.blue = self.blue + const
    end

    if self.green + const > 65535
      self.green = 65535
    elsif self.green + const < 0
      self.green = 0
    else
      self.green = self.green + const
    end
    self
  end

  def *(const)
    self.red = self.red * const > 65535 ? 65535 : self.red * const
    self.blue = self.blue * const > 65535 ? 65535 : self.blue * const
    self.green = self.green * const > 65535 ? 65535 : self.green * const
    self
  end
end

class Array
  def my_each(&prc)
    (0...self.count).each do |i|
      prc.call(self[i])
    end
    self
  end
end
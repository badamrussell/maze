class Array
  def two_sum
    sums = []
    (0..(self.count - 2)).each do |i|
      ((i + 1)..(self.count-1)).each do |j|
        sums << [i,j] if self[i] + self[j] == 0
      end
    end
    sums
  end
end

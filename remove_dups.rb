class Array
  def my_uniq
    results_arr = []
    self.each do |num|
      results_arr << num if !results_arr.include?(num)
    end
    results_arr
  end
end


def my_transpose(rows)
  cols = []
  rows.count.times { cols << [] }
  (0..(rows.count - 1)).each do |i|
    (0..(rows.count - 1)).each do |j|
      cols[j][i] = rows[i][j]
    end
  end
  cols
end
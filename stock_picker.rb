def stock_picker(arr)
  answer = [0,0,0]
  arr.each_with_index do |price, day|
    ((day+1)..(arr.count-1)).each do |i|
      answer = [arr[i]-price,day,i] if answer[0] < (arr[i]-price)
    end
  end
  [answer[1],answer[2]]
end
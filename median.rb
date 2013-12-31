def median(arr)
  arr.sort!
  if arr.count % 2 == 1
    arr[arr.count / 2]
  else
    (arr[arr.count / 2 - 1] + arr[arr.count / 2]) / 2.0
  end
end
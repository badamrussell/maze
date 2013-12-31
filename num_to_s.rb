def num_to_s(num,base)
  digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

  new_base = 1
  str = ""
  until new_base > num
    str << digits[(num/new_base) % base]
    new_base *= base
  end
  str.reverse!
end
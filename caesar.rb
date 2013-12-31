def caesar(str, num)
  dictionary = ("a".."z").to_a
  result = ""

  str.each_char do |letter|
    result << dictionary[(dictionary.index(letter) + num) % 26]
  end

  result
end
def nine_nine_nine(num)
  digits = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    1000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion"
  }

  word_num = ""
  # "eight hundred"
  word_num << digits[num/100] << " hundred" if num > 99
  # "eight hundred twenty"
  # "eight hundred twenty three"
  if (num % 100) > 19
    word_num << " " << digits[(num % 100) - (num % 10)]
    word_num << " " << digits[num % 10] if num % 10 != 0
  elsif (num % 100) > 0 && (num % 100) < 20
    word_num << " " << digits[num % 100]
  end
  word_num
end
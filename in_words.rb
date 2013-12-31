class Fixnum
  DIGITS = {
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
    90 => "ninety"
  }
  def in_words
    return "zero" if self == 0
    results = []
    results << nine_nine_nine(self/1_000_000_000_000) << "trillion" if self >= 1_000_000_000_000
    results << nine_nine_nine(self/1_000_000_000 % 1000) << "billion" if self >= 1_000_000_000 && self/1_000_000_000 % 1000 != 0
    results << nine_nine_nine(self/1_000_000 % 1000) << "million" if self >= 1_000_000 && self/1_000_000 % 1000 != 0
    results << nine_nine_nine(self/1_000 % 1000) << "thousand" if self >= 1_000 && self/1_000 % 1000 != 0
    results << nine_nine_nine(self % 1000) if self % 1000 != 0

    results.join(" ")
  end

  def nine_nine_nine(num)
    word_num = []

    word_num << DIGITS[num/100] << "hundred" if num > 99

    if (num % 100) > 19
      word_num << DIGITS[(num % 100) - (num % 10)]
      word_num << DIGITS[num % 10] if num % 10 != 0
    elsif (num % 100) > 0 && (num % 100) < 20
      word_num << DIGITS[num % 100]
    end
    word_num
  end
end
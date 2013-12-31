def correct_hash(wrong_hash)
  new_hash = {}
  wrong_hash.each do |k, v|
    new_hash[(k.to_s.ord + 1).chr.to_sym] = v
  end
  new_hash
end
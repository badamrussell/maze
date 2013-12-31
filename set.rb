class Hash
  def set_add_el(set, el)
    set[el] = true
  end

  def set_remove_el(set, el)
    set.delete(el)
  end

  def set_list_els(set)
    set.keys
  end

  def set_member?(set, el)
    set.has_key?(el)
  end

  def set_union(set1, set2)
    set1.merge(set2)
  end

  def set_intersection(set1, set2)
    set1.select do |i|
      set2.include?(i)
    end
  end

  def set_minus(set1, set2)
    set1.select do |i|
      !set2.include?(i)
    end
  end
end
def hanoi(discs)
  master_arr = [(1..discs).to_a,[],[]]

  until master_arr[2] == (1..discs).to_a
    print "From: "
    from = gets.chomp.to_i-1
    print "To: "
    to = gets.chomp.to_i-1

    move = master_arr[from].pop
    if master_arr[to].empty? || move > master_arr[to][-1]
      master_arr[to] << move
    else
      master_arr[from] << move
      print "That's an illegal move."
    end
    puts "Tower 1: "
    puts master_arr[0]
    puts "Tower 2: "
    puts master_arr[1]
    puts "Tower 3: "
    puts master_arr[2]
  end
  print "You win!"
end
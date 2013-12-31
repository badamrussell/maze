class Position
  attr_reader :moves, :previous, :row, :column, :weight
  @@end_col = 14
  @@end_row = 1

  def initialize(moves,previous,row,column)
    @moves = moves
    @previous = previous #position object
    @row = row
    @column = column
    @weight = (row - @@end_row).abs + (column - @@end_col).abs + moves
  end

  def <=>(other_position)
    return 1 if @weight < other_position.weight
    return -1 if @weight > other_position.weight
    return 0
  end
end

def nice_print(arr)
  arr.each do |row|
    puts row.join("   ")
  end
end

def load_maze(filename)
  maze_arr = []

  File.open(filename,"r").each do |line|
    maze_arr << line.chomp.split("")
  end

  maze_arr
end

def find_start(arr)
  arr.each_with_index do |element,index|
    if element.include?("S")
      return Position.new(0,nil,index,element.index("S"))
    end
  end
end

def find_valid_adjacent(location_arr,maze_arr,previous_location)
  main_column = location_arr[1]
  main_row = location_arr[0]
  (main_row-1..main_row+1).each do |row|
    (main_column-1..main_column+1).each do |column|
      if (main_column == column && main_row == row)
      elsif (previous_location[0] == row && previous_location[1] == column)
      elsif (maze_arr[row][column] != "*")
        #something we want
      end
    end
  end
end

def find_valid_adjacent2(position_obj,maze_arr)
  possible_positions=[]
  main_column = position_obj.column
  main_row = position_obj.row
  if position_obj.previous
    previous_column = position_obj.previous.column
    previous_row = position_obj.previous.row
  else
    previous_column = position_obj.column
    previous_row = position_obj.row

  end

  (main_row-1..main_row+1).each do |row|

    (main_column-1..main_column+1).each do |column|

      if (main_column == column && main_row == row)
      elsif (previous_row == row && previous_column == column)
      elsif (row != main_row && column != main_column)
      elsif (maze_arr[row][column] == " " || maze_arr[row][column] == "E")
        #something we want

        prev_position = position_obj.previous
        valid = true

        possible_positions << Position.new(position_obj.moves+1,position_obj,row,column) if valid

      end
    end
  end
  return possible_positions
end

def find_path
  possible_moves = []
  maze_arr = load_maze("maze1.txt")
  c_position = find_start(maze_arr)

  while c_position
    p "#{possible_moves.length} : #{c_position.moves} #{c_position.weight} [#{c_position.row},#{c_position.column}]"
    nice_print(maze_arr)
    puts "------------------------------"
    maze_arr[c_position.row][c_position.column] = c_position.moves
    new_moves = find_valid_adjacent2(c_position,maze_arr)

    addmove = true

    if addmove
      possible_moves += new_moves
      possible_moves.sort!
      c_position = possible_moves.pop
    end

    break if maze_arr[c_position.row][c_position.column] == "E"
  end

  final_maze = load_maze("maze1.txt")
  final_count = c_position.moves

  c_position = c_position.previous
  while c_position

    final_maze[c_position.row][c_position.column] = "X" if final_maze[c_position.row][c_position.column] != "S"
    c_position = c_position.previous
  end

  nice_print(final_maze)

  final_count
end

p find_path

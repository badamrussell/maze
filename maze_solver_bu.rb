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

  def isEnd?

  end

  def OLDsort(other_position)
    return 1 if @moves < other_position.moves
    return -1 if @moves > other_position.moves
    return 0
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
=begin
        while (prev_position)
          if prev_position.row == row && prev_position.column == column
            valid = false
            break
          end
          prev_position = prev_position.previous
        end
=end
        possible_positions << Position.new(position_obj.moves+1,position_obj,row,column) if valid

      end
    end
  end
  return possible_positions
end

def find_path_work
  possible_moves = []
  maze_arr = load_maze("maze1.txt")
  c_position = find_start(maze_arr)

  while maze_arr[c_position.row][c_position.column] != "E"
    p c_position.moves
    maze_arr[c_position.row][c_position.column] = c_position.moves
    new_moves = find_valid_adjacent2(c_position,maze_arr)


    possible_moves += new_moves
    #possible_moves.shuffle!
    #possible_moves.sort!
    c_position = possible_moves.pop

  end

  nice_print(maze_arr)
end

def find_path
  possible_moves = []
  maze_arr = load_maze("maze1.txt")
  c_position = find_start(maze_arr)

  while c_position
    p c_position.moves
    maze_arr[c_position.row][c_position.column] = c_position.moves
    new_moves = find_valid_adjacent2(c_position,maze_arr)

    addmove = true
=begin
    new_moves.each do |pos1|

      possible_moves.each_with_index do |pos2, index|
        if pos1.row == pos2.row && pos1.column == pos2.column && pos2.moves < pos1.moves
          c_position = possible_moves.delete_at(index)
          addmove = false
          break
        end
      end
    end
=end
    if addmove
      possible_moves += new_moves
      #possible_moves.shuffle!
      possible_moves.sort!
      c_position = possible_moves.pop
    end

    break if maze_arr[c_position.row][c_position.column] == "E"
  end

  nice_print(maze_arr)
end

find_path
#p find_start(load_maze("maze1.txt"))


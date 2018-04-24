require "io/console"
require "colorize"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :space
      return_cursor
    when :down
      update_pos(key)
    when :up
      update_pos(key)
    when :right
      update_pos(key)
    when :left
      update_pos(key)
    when :tab
    when :return
      return_cursor
    when :newline
    when :escape
    when :down
    when :right
    when :left
    when :backspace
    when :delete
    when :ctrl_c
      Process.exit(0)
    end 
  end
  
  def return_cursor
    cursor_pos
  end
  
  def valid_move?(key_press)
    # might be better in board
    new_pos_x = cursor_pos[1] + MOVES[key_press][0]
    new_pos_y = cursor_pos[0] + MOVES[key_press][1]
    (0...8).cover?(new_pos_x) && (0...8).cover?(new_pos_y)
  end
  
  def update_pos(key_press)
    if valid_move?(key_press)
      cursor_pos[1] += MOVES[key_press][0]
      cursor_pos[0] += MOVES[key_press][1]
    else 
      
    end
    cursor_pos
  end
end
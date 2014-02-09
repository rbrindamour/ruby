module Play_sudoku
  require 'sudoku'
  $tempfile=File.open("C:\\Temp\\sudoku3.txt",  'r')
  puts Sudoku.solve(Sudoku::Puzzle.new($tempfile.readlines))
end
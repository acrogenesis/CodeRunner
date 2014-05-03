class String
  def to_file(filename)
    File.open(filename, 'w') {|f| f.write self }
  end
end

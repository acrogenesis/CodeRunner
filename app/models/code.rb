require 'Open3'
class Code < ActiveRecord::Base
  validates_uniqueness_of :titulo
  validates_presence_of :titulo, :codigo

  def submit
    entrada.to_file("in.txt")
    codigo.to_file("codigo.cpp")

    stdout_str, stderr_str, status = Open3.capture3("g++ codigo.cpp -o a.out")

    if stderr_str
      remove_files
      stderr_str.html_safe
    else
      out = `./a.out < in.txt`
      remove_files
      out
    end

  end
  def remove_files
    system("rm a.out")
    system("rm codigo.cpp")
    system("rm in.txt")
  end
end

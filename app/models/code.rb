class Code < ActiveRecord::Base
  validates_uniqueness_of :titulo
  validates_presence_of :titulo, :codigo

  def submit
    entrada.to_file("in.txt")
    codigo.to_file("codigo.cpp")
    system("g++ codigo.cpp -o a.out")
    out = `./a.out < in.txt`
    system("rm a.out")
    system("rm codigo.cpp")
    system("rm in.txt")
    out
  end
end

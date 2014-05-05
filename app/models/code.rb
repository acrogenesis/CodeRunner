class Code < ActiveRecord::Base

  CATEGORIAS=[
    "ciclos",
    "arreglos",
    "condiciones",
    "estructuras"
  ]
  validates_uniqueness_of :titulo
  validates_presence_of :titulo, :codigo, :category

  def submit
    entrada.to_file("in.txt")
    codigo.to_file("codigo.cpp")
    stdout_str, stderr_str, status = Open3.capture3("g++ codigo.cpp -o a.out")
    if !stderr_str.empty?
      remove_files
      stderr_str
    else
      out = `./a.out < in.txt`
      remove_files
      out
    end
  end

  def self.categories
    CATEGORIAS
  end

  def remove_files
    system("rm a.out")
    system("rm codigo.cpp")
    system("rm in.txt")
  end
end

class SubmitCode
  attr_accessor :output

  def initialize(code, input="")
    input.to_file("in.txt")
    code.to_file("code.cpp")
    @output = run_code
  end

  def run_code
    system("g++ code.cpp -o a.out")
    out = `./a.out < in.txt`
    system("rm a.out")
    system("rm code.cpp")
    system("rm in.txt")
    out
  end
end

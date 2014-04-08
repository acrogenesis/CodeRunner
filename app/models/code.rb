class Code < ActiveRecord::Base
  validates_uniqueness_of :titulo
  validates_presence_of :titulo, :codigo
end

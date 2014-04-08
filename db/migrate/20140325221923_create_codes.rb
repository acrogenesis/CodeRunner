class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.text :entrada
      t.text :codigo
      t.string :titulo

      t.timestamps
    end
  end
end

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.integer :grade
      t.text :about

      t.timestamps
    end
  end
end

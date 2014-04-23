class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :subjects
      t.text :bio

      t.timestamps
    end
  end
end

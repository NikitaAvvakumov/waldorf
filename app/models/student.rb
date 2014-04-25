class Student < ActiveRecord::Base

  validates :name, presence: true #, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :grade, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 12 }
  validates :about, presence: true
end

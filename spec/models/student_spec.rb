require 'spec_helper'

RSpec.configure do |c|
  c.filter_run_excluding suspended: true
end

describe Student do

  before { @student = FactoryGirl.build(:student) }

  subject { @student }

  it { should respond_to :name }
  it { should respond_to :age }
  it { should respond_to :grade }
  it { should respond_to :about }
  it { should be_valid }

  describe 'validations' do
    context 'when name is missing' do
      before { @student.name = '' }
      it { should_not be_valid }
    end

    context 'when name is already taken', suspended: true do
      before do
        student2 = @student.dup
        student2.save
      end

      it { should_not be_valid }
    end

    context 'when age is invalid' do
      it 'should be invalid' do
        ['a', 2.5, -7].each do |bad_age|
          @student.age = bad_age
          expect(@student).to_not be_valid
        end
      end
    end

    context 'when age is valid' do
      it 'should be valid' do
        [4, 7, 15].each do |good_age|
          @student.age = good_age
          expect(@student).to be_valid
        end
      end
    end

    context 'when grade is invalid' do
      it 'should not be valid' do
        [0, 'C', 13, 5.6].each do |bad_grade|
          @student.grade = bad_grade
          expect(@student).not_to be_valid
        end
      end
    end

    context 'when grade is valid' do
      it 'should be valid' do
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].each do |good_grade|
          @student.grade = good_grade
          expect(@student).to be_valid
        end
      end
    end

    context 'when the About text is missing' do
      before { @student.about = '' }
      it { should_not be_valid }
    end
  end
end

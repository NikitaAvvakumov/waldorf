require 'spec_helper'

describe Teacher do
  before { @teacher = FactoryGirl.build(:teacher) }

  subject { @teacher }

  it { should respond_to :name }
  it { should respond_to :subjects }
  it { should respond_to :email }
  it { should respond_to :bio }
  it { should be_valid }

  describe 'validations' do

    context 'when name is missing' do
      before { @teacher.name = '' }
      it { should_not be_valid }
    end

    context 'when subjects are missing' do
      before { @teacher.subjects = '' }
      it { should_not be_valid }
    end

    context 'when email is missing' do
      before { @teacher.email = '' }
      it { should_not be_valid }
    end

    context 'when bio is missing' do
      before { @teacher.bio = '' }
      it { should_not be_valid }
    end

    context 'when email is already in use' do
      before { Teacher.create(name: 'Different', subjects: 'different', bio: 'different', email: @teacher.email.upcase) }
      it { should_not be_valid }
    end

    context 'when email address format is invalid' do
      it 'should not be valid' do
        %w(useratwaldorf.info user@waldorf user@waldorf. user_waldorf.info user@waldorf..info).each do |invalid_email|
          @teacher.email = invalid_email
          expect(@teacher).to be_invalid
      end
      end
    end
  end
end
require 'spec_helper'

describe 'StaticPages' do

  subject { page }

  describe 'Home Page' do
    before { visit root_path }

    it { should have_content 'Tartu Waldorf School' }
    it { should have_title 'Tartu Waldorf School' }
  end

  describe 'Contact Page' do
    before { visit contact_path }

    it { should have_content 'How to contact us' }
    it { should have_title 'TWG | Contact' }
  end
end

require 'spec_helper'

describe 'StaticPages' do

  subject { page }

  describe 'Home Page' do
    before { visit root_path }

    it { should have_content 'Tartu Waldorfgümnaasium' }
    it { should have_title 'Tartu Waldorfgümnaasium' }
  end

  describe 'Contact Page' do
    before { visit contact_path }

    it { should have_content 'How to contact us' }
    it { should have_title 'TWG | Contact' }
  end
end

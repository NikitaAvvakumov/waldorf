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

  describe 'About Pages' do

    describe 'Vision & Mission' do
      before { visit vision_path }

      it { should have_content 'Our vision' }
      it { should have_content 'Our mission' }
      it { should have_content 'Our core values' }
      it { should have_title 'TWG | Vision' }
    end

    describe 'Our History' do
      before { visit history_path }

      it { should have_content 'The history of Tartu Waldorfgümnaasium' }
      it { should have_title 'TWG | History' }
    end
  end
end

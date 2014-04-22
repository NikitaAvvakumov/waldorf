require 'spec_helper'

describe 'About Pages' do

  subject { page }

  describe 'About Us' do
    before { visit about_path }

    it { should have_title 'About Us' }
  end

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
module TestHelpers

  def soap
    save_and_open_page
  end
end

RSpec.configure do |c|
  c.include TestHelpers, type: :feature
end
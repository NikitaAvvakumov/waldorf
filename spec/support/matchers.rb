include ApplicationHelper

RSpec::Matchers.define :have_asset_carousel do
  match do |page|
    expect(page).to have_css("img[src*='health_potion.png']")
    expect(page).to have_css("img[src*='spell_symbol.png']")
    expect(page).to have_css("img[src*='art_icon.png']")
  end
end
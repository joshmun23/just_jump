require 'rails_helper'

feature 'user searches a menu item', %{
  As a user,
  I want to search for a menu item,
  So that I can view a list of my favorite foods
} do

  scenario 'user searches for food item with search location ' do
    user = FactoryGirl.create(:user)

    visit '/food_searches/new'

    fill_in 'Search term', with: 'chicken parm'
    fill_in 'Search location', with: 'boston'

    click_on "Feed Your Need"

    expect(page).to have_content('Chicken Parmesan')
    expect(page).to have_content('2.00')
  end

  scenario 'user sees list items in an accordion' do
    user = FactoryGirl.create(:user)

    visit '/food_searches/new'

    fill_in 'Search term', with: 'chicken parm'
    fill_in 'Search location', with: 'boston'

    click_on "Feed Your Need"

    expect(page).to have_css('.accordion-navigation')
  end
end

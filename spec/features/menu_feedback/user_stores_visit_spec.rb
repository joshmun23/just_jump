require 'rails_helper'

feature 'User saves a restaurant and menu item',
  %{ As a user, I want to be able to store a
     restaurant and menu item, so that I can
     review it later for others to see. } do

    # [ ] User searches for menu item and saves the
    #     info to the Spots Model

  scenario 'user saves spot to review later' do
    user = FactoryGirl.create(:user)

    visit '/food_searches/new'

    fill_in 'Search term', with: 'chicken parm'
    fill_in 'Search location', with: 'boston'

    click_on "Feed Your Need"

    expect(page).to have_content('Chicken Parmesan')
    expect(page).to have_content('2.00')

    first('.food_saver').click_on('Let\'s eat!')
  end
end

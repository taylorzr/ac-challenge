require_relative 'demo_helper'

feature "Demo" do 
  include DemoHelper

  background do
    retrieve_application
    fill_out_application
    accept_credit_score
    select_ach
    fill_out_contract
    sleep(1) until (page.has_content?("Continue to Final Step"))
  end

  scenario "Filling out application, and signing agreement" do
    expect(page).to have_content "Account Type"
    expect(page).to have_content "Bank Account"
  end
end


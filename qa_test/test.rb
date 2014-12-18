require 'capybara'
require 'capybara/rspec'
require 'pry'
require_relative 'helper'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://demo.avantcredit.com'

feature "Demo" do 

  include DemoHelper

  scenario "Filling out application, and signing agreement" do
    retrieve_application
    fill_out_application
    accept_credit_score
    select_ach
    fill_out_contract
    sleep(1) until (page.has_content?("Continue to Final Step"))
    expect(page).to have_content "Continue to Final Step"
  end
end


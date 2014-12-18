module DemoHelper
  def retrieve_application
    visit "/"
    click_on "apply-now-link"
  end

  def fill_out_application
    @@application_fields_with_data.each do |field_name, value|
      if @@dropdowns.include?(field_name)
	select value, from: field_name
      else
	fill_in field_name, with: value
      end
    end
    check :customer_electronic_communications_consent
    click_on "Agree and Get Your Rates"
  end

  def accept_credit_score
    sleep(1) until (page.has_content?("Yes, I Understand"))
    click_on "Yes, I Understand"
  end

  def select_ach
    first("label").click
  end

  def fill_out_contract
    sleep(1) until (page.has_content?("Sign Agreement"))
    @@contract_fields_with_data.each do |field_name, value|
      fill_in field_name, with: value
    end
    click_on "Sign Agreement"
  end

  @@dropdowns = %i(
    customer_address_state
    person_date_of_birth_month
    person_date_of_birth_day
    person_date_of_birth_year
    income_income_type
  )

  @@application_fields_with_data = {
    person_first_name: "Zach",
    person_last_name: "Taylor",
    customer_address_address_1: "3729 County Road 98",
    customer_address_address_2: "Cave",
    customer_address_city: "Bridgeport",
    customer_address_state: "AL",
    customer_address_zip: "35740",
    person_date_of_birth_month: "Jun",
    person_date_of_birth_day: "06",
    person_date_of_birth_year: "1992",
    person_home_phone: "773-867-5309",
    customer_email: "caveman@avantcredit.test", 
    customer_password: "password",
    customer_password_confirmation: "password",
    income_income_type: "Employed (Non-Military)",
    person_ssn: "424424242",
    income_monthly_net_income: "4000"
  }

  @@contract_fields_with_data = {
    esign_first_name: "Zach",
    esign_last_name: "Taylor",
    esign_ssn_last_4: "4242"
  }
end


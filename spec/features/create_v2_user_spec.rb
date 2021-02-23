require "rails_helper"

feature "Create V2 User", js: true do
  scenario "I can create a V2 user" do
    When "I try to create a new V2 user" do
      visit new_v2_user_path
      page.fill_in("Name", with: "Mi")
      page.fill_in("Email", with: "saramic@gmail")
      page.fill_in("Age", with: "4")
      page.fill_in("Password", with: "asdf")
      page.click_on("Create V2 user")
    end

    Then "I get errors around all the fields" do
      wait_for do
        page.find("#error_explanation").text
      end.to eq(<<~EO_ERROR_TEXT.strip
        3 errors prohibited this v2_user from being saved:
        Name is too short (minimum is 3 characters)
        Age must be greater than or equal to 13
        Password is too short (minimum is 6 characters)
      EO_ERROR_TEXT
               )
      sleep(2)
    end

    When "I fill in the fields correctly" do
      page.fill_in("Name", with: "Michael")
      page.fill_in("Email", with: "saramic@gmail.com")
      page.fill_in("Age", with: "45")
      page.fill_in("Password", with: "1password")
      page.click_on("Create V2 user")
    end

    Then "I can successfully create a user" do
      wait_for do
        page.find(".alert.alert-info span").text
      end.to eq "V2 user was successfully created."
      sleep(2)
    end
  end
end

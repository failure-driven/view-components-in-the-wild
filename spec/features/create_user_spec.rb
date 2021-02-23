require "rails_helper"

feature "Create User", js: true do
  scenario "I can create a user" do
    When "I try to create a new user" do
      visit new_user_path
      page.fill_in("Name", with: "Mi")
      page.fill_in("Email", with: "saramic@gmail")
      page.fill_in("Age", with: "4")
      page.fill_in("Password", with: "asdf")
      page.click_on("Create User")
    end

    Then "I get errors around all the fields" do
      wait_for do
        page.find("#error_explanation").text
      end.to eq(<<~EO_ERROR_TEXT.strip
        3 errors prohibited this user from being saved:
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
      page.click_on("Create User")
    end

    Then "I can successfully create a user" do
      wait_for do
        page.find(".alert.alert-info span").text
      end.to eq "User was successfully created."
      sleep(2)
    end
  end
end

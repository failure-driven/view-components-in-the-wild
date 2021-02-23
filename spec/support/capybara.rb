require "capybara/rspec"
require "capybara/rails"
require "capybara-screenshot/rspec"

# Make browser slow down execution to see what's going on
# in the browser (when running non-Headless)
module SlomoBridge
  TIMEOUT = ENV.fetch("SLOMO_MS", "0").to_i / 1000.0

  def execute(*)
    sleep TIMEOUT if TIMEOUT > 0
    super
  end
end

# Don't wait too long in `have_xyz` matchers
Capybara.default_max_wait_time = 2 # the default is 2

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: {
      chromeOptions: {
        args: ["window-size=800,960"],
      },
    },
  ).tap do |driver|
    # Enable slomo mode
    driver.browser.send(:bridge).singleton_class.prepend(SlomoBridge)
  end
end

Capybara.javascript_driver = :selenium_chrome unless ENV.fetch("NOT_CHROME", false)

Capybara::Screenshot.register_driver(:selenium_chrome) do |driver, path|
  # Resize window to get all content in the screenshot:
  # scroll height + some extra (I think to allow for address bar etc )
  needed_height = Capybara.current_session.evaluate_script("document.documentElement.scrollHeight") + 120
  current_width = driver.browser.manage.window.size[0]
  driver.browser.manage.window.resize_to(current_width, needed_height)

  driver.browser.save_and_open_screenshot(path)
end

# Locally, Keep only the screenshots generated from the last failing test suite
Capybara::Screenshot.prune_strategy = :keep_last_run

Webdrivers.cache_time = 1.month.to_i

RSpec.configure do |config|
  config.after do |example|
    if (example.metadata[:type] == :feature) &&
       example.metadata[:js] &&
       example.exception.present?
      # Capybara::Screenshot.screenshot_and_open_image
    end
  end
end

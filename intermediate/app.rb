require 'sinatra'
require 'selenium-webdriver'

# options = Selenium::WebDriver::Chrome::Options.new(detach: true)

webdriver_thread = Thread.new do
  driver = Selenium::WebDriver.for(:firefox)
  driver.manage.timeouts.implicit_wait = 10
  driver.navigate.to('localhost:3000')
  driver
end

get '/' do
  driver = webdriver_thread.value
  driver.action.move_to_location(650, 90).click.perform
  sleep 2
  response.header["Content-Type"] = "image/png"
  driver.screenshot_as(:png)
end
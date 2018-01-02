require "watir-webdriver"
include Selenium
PageObject.javascript_framework = :jquery

class BrowserSession
  attr_accessor :browser,
                :fill_step_hash,
                :current_user,
                :current_page,
                :ie

  # Name: initialize
  # Input: No input is needed.
  # Purpose: Initializes the webdriver using the correct settings

  def initialize
    puts "++++++++++++++++++++++++++++++++++++++++++++" + ENV['browser_type'] + "^^^^^^^^^^^^^^^^^^^^^^"
    ENV["browser_stack"] == "true" ? self.create_browserstack : self.create_browser(DataHelper.environment_browser_type)
    self.set_browser_experience unless ENV["browser_stack"] == "true"
    page_object_array = []
    Dir["#{File.dirname(__FILE__)}/../pages/*.rb"].each { |f|
      page_name = f.gsub(/(.*\/)/, "").gsub(".rb","").split("_").collect { |a| a.capitalize }.join("")
      page_object_array.push(page_name)
    }
    self.fill_step_hash = {}
    page_object_array.each{|x| self.fill_step_hash[x] = false}

    if DataHelper.environment_browser_type.downcase == "ie" then
      self.ie = true
    end

  end

  def create_browser(browser_type)
    browser_type == 'chrome' ? (self.browser = Watir::Browser.new browser_type.downcase.to_sym, :switches => ["--disable-extensions"]) :
      (self.browser = Watir::Browser.new browser_type.downcase.to_sym)
  end

  def create_browserstack
    caps = WebDriver::Remote::Capabilities.new
    caps[:name] = "Watir WebDriver"

    begin
      device_set_up = get_data_from_yml_file("browserstack_configurations.yml")[ENV['device'].upcase.gsub(" ","_")]
      device_set_up.each do |attribute, value|
        caps[attribute.downcase] = value
      end
    rescue
      raise "--->> Sorry, #{ENV['device'].upcase.gsub(" ","_")} is not defined in the browserstack_configuration.yml file, please verify your device name is correct or define your new device"
    end


    caps["browserstack.debug"] = "true"
    caps['browserstack.local'] = "true"

    self.browser = Watir::Browser.new(:remote,
                                 :url => "http://abhirambharadwaj2:ytGSDg5JQ9xSpAyxijy6@hub.browserstack.com/wd/hub",
                                 :desired_capabilities => caps)

  end

  def set_browser_experience()
    screen_width = self.browser.execute_script("return screen.width;")
    screen_height = self.browser.execute_script("return screen.height;") - 30

    browser_sizes = {
        "desktop" => [screen_width,screen_height],
        "tablet" => [775,screen_height],
        "mobile" => [400,screen_height]
    }
    raise "Unknown browser_size:'#{ENV["browser_size"]}'" if ENV["browser_size"] and browser_sizes[ENV["browser_size"]].nil?
    width, height = browser_sizes[ENV["browser_size"].nil? ? "desktop" : ENV["browser_size"].downcase]
    self.browser.window.resize_to(width, height)
    self.browser.window.move_to(0,0)
  end

  # Name: return_page_load_state
  # Input: No input is needed.
  # Purpose: It waits until the page is fully loaded, main purpose is for Internet Explorer
  def return_page_load_state()
    @browser.execute_script("return document.readyState") == "complete" ? true : false
  end
end
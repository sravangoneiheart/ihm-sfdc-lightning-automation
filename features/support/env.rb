$:.unshift File.join(File.dirname(__FILE__), "..", 'pages')

require 'page-object'
require 'page-object/page_factory'
require 'date'
require 'win32ole'
require 'active_record'

require File.dirname(__FILE__) + '/data/yml_utilities.rb'
require File.dirname(__FILE__) + '/data/data_classes/web_page_data.rb'
require File.dirname(__FILE__) + '/data/data_helper.rb'
require File.dirname(__FILE__) + '/../../features/pages/page_helper.rb'

require 'web_page'
require 'erb'
require 'date'
#require 'sequel'
#require 'salesforce_bulk'
$last_billing = ''
ENV['TIMESTAMP'] ||= Time.now.strftime "%Y-%m-%d_%H-%M-%S"

total_passed = 0
total_failed = 0


Before do |scenario|
    $start_time = Time.now
    $captured_results = Hash.new
    ActiveRecord::Base.establish_connection(
        :adapter => "sqlserver",
        :host => database_host,
        :database => database_name,
        :username => database_login,
        :password => database_password)

    keep_trying_to_set(2) {
        @browser_session = BrowserSession.new()
        @browser = @browser_session.browser
    }
    WebPageData.set_browser_session_object(@browser_session)

end

After do |scenario|

  ActiveRecord::Base.remove_connection()

  output_folder = (ENV["output_folder"] || "features/output") + "/" + ENV['TIMESTAMP'][0,10]
  scenario_folder = output_folder + '/' + 'failure screenshots' + '/'

  if scenario.respond_to? (:title)
    script_name = scenario.name
  else
    script_name = scenario.scenario_outline.title
  end

  screenshot_file = scenario_folder + script_name.gsub(/[\/\\| <>\n\r]+/, "_")[0..90] + ".png"
  current_path = ''

  if scenario.failed?
    begin
      total_failed += 1

      screenshot_file.split(/\//).map{|m| m.split(/\\/)}.flatten.each {|folder|
        next if folder =~ /\.png/
        current_path += folder + "/"
        next if folder.downcase =~ /:/
        Dir.mkdir(current_path) unless File.exists?(current_path)
      }

      @browser.screenshot.save screenshot_file
      embed screenshot_file, 'image/png'

    rescue Exception => e
      p e.message
      p "Could not capture screenshot"
    end
  else
    total_passed +=1
    # @browser_session.browser.quit if close_browser_when_finished and @browser_session.browser
  end

  @browser_session.browser.quit if close_browser_when_finished and @browser_session.browser
end

World(PageObject::PageFactory)

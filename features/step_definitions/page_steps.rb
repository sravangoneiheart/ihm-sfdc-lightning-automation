When /^(?:a|the) user navigates to the Salesforce website$/ do
  password = ENV["password"]

  p salesforce_environment_url
  @browser.goto(salesforce_environment_url)
  #

  if ENV['browser_type'] == 'firefox'

    au3 = WIN32OLE.new("AutoItX3.Control")

    au3.WinWaitActive("Authentication Required")

    p "I see the authentication window"
    au3.Send("#{ENV["user_name"]}")
    au3.Send("{TAB}")
    au3.Send(password.gsub('!', '{!}'))
    au3.Send("{ENTER}")
  end

   sleep 10
  step "the application navigates to the Salesforce Home or Salesforce User Detail page"


end


When /^(?:a|the) user navigates to the BMS website$/ do

  username = ENV["user_name"]
  password = ENV["password"]

  if ENV["browser_type"] != 'ie'
    @browser.close
    step "the user opens a new ie browser"
  end

  @browser.goto(bms_environment_url)

  sleep 2

  au3 = WIN32OLE.new("AutoItX3.Control")
  au3.WinWaitActive("Windows Security")
  p username
  p password
  au3.Send(username)
  au3.Send("{TAB}")
  #au3.Send(password.gsub('!','{!}'))
  au3.Send(password)
  sleep 3
  au3.Send("{ENTER}")

  sleep 2

  step "the application navigates to the BMS home page"
end

#subbu - 08/04/2016 - creating a new step definition
And(/^the user navigates to BMS line item$/) do
  username = ENV["user_name"]
  password = ENV["password"]

  sleep 2

  au3 = WIN32OLE.new("AutoItX3.Control")
  au3.WinWaitActive("Windows Security")
  p username
  p password
  au3.Send(username)
  au3.Send("{TAB}")
  #au3.Send(password.gsub('!','{!}'))
  au3.Send(password)
  sleep 3
  au3.Send("{ENTER}")

  sleep 2

  @browser.window(:title => /Line Item Details - EDITING/).use

end

When /^the user closes the browser$/ do
  @browser.windows.last.close
end

When /^the user opens a new (ie |firefox |chrome )?browser$/ do |browser_type|
  keep_trying_to_set(2) {
    browser_type = ENV['browser_type'] if browser_type.nil?
    browser_type = browser_type.strip
    p "opening a new #{browser_type} browser"
    @browser = @browser_session.create_browser(browser_type)
  }
end

When /^the user closes the popup window$/ do
  begin
    @browser.windows.last.use.close
  rescue Exception => e
    p e if verbose_messages
  ensure
    @browser.windows.first.use
  end
end

When /^the application (?:navigates to|remains on) the (.+?(?: or .+?)*?) page$/ do |page_names|
  # p "hi subbu"
  # subbu 08/04/2016 - Added below code to focus to other page
  #page_names is just the name, user gives for a page in feature steps
  if (page_names == "BMS line item details")
    @browser.window(:title => /Line Item Details - EDITING/).use
  end
  if (page_names == "BMS Select Rating Book Popup")
    @browser.windows.last.use
  end
  #subbu
  #subbu 08/04/2016 - Added a 2 sec wait time
  sleep 1
  #subbu
  application_is_on_page?(page_names).should be_true
end
#
When /^the user clicks(?: the| a)? (.+)$/ do |page_element|
  # p "subbu"
  begin
    Watir::Wait.until(10) { @browser_session.return_page_load_state }
    Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? }
    Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").enabled? }
    Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").present? }
    field_type = @current_page.send(page_element.gsub(" ", "_").downcase + "_element").class.to_s
    # p field_type
    # if field_type =~ /link|button/i
    if field_type =~ /button/i
      #    # begin
      begin
        @current_page.send(page_element.gsub(" ", "_").downcase)
      rescue Selenium::WebDriver::Error::UnhandledAlertError
        @browser.alert.ok
      end
      #     # rescue Net::ReadTimeout
      #end
    else

      case page_element
        when /close_result_test/
                while(@current_page.send(page_element.gsub(" ", "_").downcase + "_element").present?)
                   @current_page.send(page_element.gsub(" ", "_").downcase + "_element").click
                end
        else
                  @current_page.send(page_element.gsub(" ", "_").downcase + "_element").click
#          puts "checking....."
      end



    end
  rescue
    element = @current_page.send(page_element.gsub(" ", "_").downcase + "_element")
    p element
    script = <<-JS
       arguments[0].click();
    JS
    @current_page.execute_script(script, element)
  end
end



# When /^the user clicks(?: the| a)? (.+)$/ do |page_element|
#   Watir::Wait.until(60) {@current_page.send(page_element.gsub(" ","_").downcase + "_element").exists?}
#   field_type = @current_page.send(page_element.gsub(" ","_").downcase + "_element").class.to_s
#   if field_type =~ /button/i
#     @current_page.send(page_element.gsub(" ","_").downcase)
#   else
#     @current_page.send(page_element.gsub(" ","_").downcase + "_element").click
#   end
# end



And(/^the user click on (.+) radio button$/) do |page_element|
  @current_page.send("select_"+page_element.gsub(" ", "_").downcase)
end

And(/^the user click the (.+)$/) do |table|
  # p @current_page.send(table.gsub(" ","_").downcase + "_element")
  Watir::Wait.until(30) { @current_page.send(table.gsub(" ", "_").downcase + "_element").exists? }
  Watir::Wait.until(30) { @current_page.send(table.gsub(" ", "_").downcase + "_element").present? }
  @current_page.send(table.gsub(" ", "_").downcase + "_element").click

end

When /^take a screenshot( after closing the dialog window)?$/ do |close_modal|
  @browser.windows.last.use

  output_folder = (ENV["output_folder"] || "features/output") + "/" + ENV['TIMESTAMP'][0, 10]
  scenario_folder = output_folder + '/' + 'success screenshots' + '/'
  screenshot_file = scenario_folder + Time.now.strftime("%Y-%m-%d_%H-%M-%S") + ".png"
  current_path = ''

  screenshot_file.split(/\//).map { |m| m.split(/\\/) }.flatten.each { |folder|
    next if folder =~ /\.png/
    current_path += folder + "/"
    next if folder.downcase =~ /:/
    Dir.mkdir(current_path) unless File.exists?(current_path)
  }

  @browser.screenshot.save screenshot_file
  embed screenshot_file, 'image/png'
end

When /^(?:a|the) new browser window (opens|closes)$/ do |action|
  if action == "opens"
    @browser.windows.last.use
    # p @browser.text
  else
    p "WORKING..."
    @browser.windows.first.use
  end
end

When /^the user (confirms|cancels) on the alert box$/ do |action|
  Watir::Wait.until(10) { @browser.alert.exists? }
  if action == "confirms"
    @browser.alert.ok
  else
    @browser.alert.close
  end
end


When /^the user waits until(?: the| a)? (.+) element is displayed$/ do |page_element|
  Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? }
end

When /^the user waits until(?: the| a)? (.+)(?: element)? is not present$/ do |page_element|
  sleep 2
  @current_page.send(page_element.gsub(" ", "_").downcase + "_element").wait_while_present(300)
end

When /^the user uploads the file for (.+?)$/ do |message_key|
  message_key = message_key.gsub(" ", "_").upcase
  file_path = @current_page.class.data_class.get_input_data(message_key)["FILE_PATH"]
  @current_page.file_upload(file_path)
end

When /^the user drags (.+) and drops on (.+)$/ do |element1, element2|
  @current_page.send(element1.gsub(" ", "_").downcase + "_element").drag_and_drop_on @current_page.send(element2.gsub(" ", "_").downcase + "_element")
end

# Aman - Code changes for clone flight
And(/^the user search for "(.*)"$/) do |search_value|
  step "the user clicks the flight name filter"
  step "the user clicks the filter option"
  step "the user fills in \"#{search_value}\" for flight name search"
  step "the user clicks filter button"
end

When /^the user captures the value for (.+)$/ do |page_element|
  Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? }
  $captured_value = @current_page.send(page_element.gsub(" ", "_").downcase)
  puts $captured_value
  #Subbu 08/05/2016  - extra code to strip the word Order from the order #
  if ($captured_value.to_s.include? "Order")
    $captured_value = $captured_value.to_s.slice!(6, 5)
    p $captured_value
  end
  #Aman - Code changes for clone flight - 09/23/2016
  if ($captured_value.to_s.include? "Flight name")
    $captured_value = $captured_value.to_s.split(": ", 3).last
    p $captured_value
  end
end
### added by pranay

When /^the user clicks (.+) and captures the value of (.+)$/ do |page_element, element2|
  step "the user clicks the #{page_element}"
  p page_element
  step "the user captures the value for #{element2}"
end

# When /^the user mouseover on (.+)$/do |page_element|
#   @current_page.send(page_element.gsub(" ","_").downcase + "_element").click
# end

begin
  When /^the user captures the second value for (.+)$/ do |page_element|
    Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? }
    $captured_value2 = @current_page.send(page_element.gsub(" ", "_").downcase)
    p $captured_value2 + "*************************"
    $captured_value3 = $captured_value2.gsub("VIERO Order ID: ", "")
    p $captured_value3 + " " + "final"
  end
end

When /^the user captures the third value for (.+)$/ do |page_element|
  Watir::Wait.until(10) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? }
  $captured_value3 = @current_page.send(page_element.gsub(" ", "_").downcase)
end


And(/^the user saves the value$/) do
  $captured_value_1 = $captured_value
  p $captured_value_1
end

And(/^the user verifies the two captured values match$/) do
  p $captured_value2
  p $captured_value
  ($captured_value2 == $captured_value).should be_true
end

And(/^the user verifies the viero captured values match$/) do
  p $captured_value3
  p $order_id
  ($captured_value3 == $order_id).should be_true

end


And(/^the user verifies the two captured values doesnot match$/) do
  ($captured_value2 != $captured_value).should be_true
end

And(/^the user verifies the values match$/) do
  ($captured_value_1 == $captured_value).should be_true
end


When /^the user waits until the order ID is available and captures the order ID$/ do
  attempt = 0
  while (@current_page.send("viero_order_id") == " ") && (attempt < 270)
    sleep 10
    @browser.refresh
    attempt +=1
  end
  $order_id = @current_page.send("viero_order_id")
  puts $order_id
  #p $order_id + "******************"
end

When /^the user captures the current URL$/ do
  $captured_url = @browser.url
  p $captured_url
end

When /^the user navigates to the captured URL$/ do
  keep_trying_to_navigate(2) { @browser.goto($captured_url) }
  # @browser.goto("https://ihm--qasf04--c.cs45.visual.force.com/apex/TTNOrderEdit?Opportunity=0068A000002WD4f")
end

When /^the user navigates to back page$/ do
  @browser.back
end

When /^the user navigates to the captured sf URL$/ do
  @browser.goto("https://ihm--crmuat.cs12.my.salesforce.com/001V000000OPZKC")
  # @browser.goto("https://ihm--qasf04--c.cs45.visual.force.com/apex/TTNOrderEdit?Opportunity=0068A000002WD4f")
end

When /^the user navigates to the captured national URL$/ do
  @browser.goto("https://ihm--qasf09.cs12.my.salesforce.com/001V000000OLtWK")
  # @browser.goto("https://ihm--qasf04--c.cs45.visual.force.com/apex/TTNOrderEdit?Opportunity=0068A000002WD4f")
end


When /^the user fills in the captured Order ID for (.+)$/ do |page_element|
  @current_page.enter_element_value(page_element, $order_id)
end

When /^the user fills in the captured SOEF Order ID for (.+)$/ do |page_element|
  @current_page.enter_element_value(page_element, $captured_value)
end

When /^the user fills in the second captured SOEF Order ID for (.+)$/ do |page_element|
  @current_page.enter_element_value(page_element, $captured_value3)
end

When /^the user clicks the captured value/ do
  @current_page.send($captured_value)
end

And(/^the sum of all (.+), (.+), (.+) equals (\d+)$/) do |element1, element2, element3, expected_value|
  $captured_value = @current_page.send(element1.gsub(" ", "_").downcase).gsub(/[^\d\.]/, '').to_f
  p $captured_value
  $captured_value = $captured_value + @current_page.send(element2.gsub(" ", "_").downcase).gsub(/[^\d\.]/, '').to_f
  p $captured_value
  $captured_value = $captured_value + @current_page.send(element3.gsub(" ", "_").downcase).gsub(/[^\d\.]/, '').to_f
  p $captured_value
  ($captured_value.to_f == expected_value.to_f).should be_true
end


And(/^the user picks (.+) from calendar$/) do |date|
  if (date == "date1")
    $date1 = Time.next(:monday, Time.warp(:days => 7)).strftime("%m/%d/%Y")
    p $date1
    $year = $date1.to_s.slice!(6, 4)
    p $year
    $day = $date1.to_s.slice!(3, 2)
    p $day
    $day = $day.sub(/^[0]+/, '')
    p $day
    $month = $date1.to_s.slice!(0, 2)
    p $month
  elsif (date == "date2")
    $date1 = Time.next(:monday, Time.warp(:days => 49)).strftime("%m/%d/%Y")
    p $date1
    $year = $date1.to_s.slice!(6, 4)
    p $year
    $day = $date1.to_s.slice!(3, 2)
    p $day
    $day = $day.sub(/^[0]+/, '')
    p $day
    $month = $date1.to_s.slice!(0, 2)
    p $month
  elsif (date =="date3")
    $date1 = Time.next(:monday, Time.warp(:days => 112)).strftime("%m/%d/%Y")
    p $date1
    $year = $date1.to_s.slice!(6, 4)
    p $year
    $day = $date1.to_s.slice!(3, 2)
    p $day
    $day = $day.sub(/^[0]+/, '')
    p $day
    $month = $date1.to_s.slice!(0, 2)
    p $month
  else
    # Aman - ADDED DATE 4 FOR CLONED FLIGHT
    $date1 = Time.next(:monday, Time.warp(:days => 210)).strftime("%m/%d/%Y")
    p $date1
    $year = $date1.to_s.slice!(6, 4)
    p $year
    $day = $date1.to_s.slice!(3, 2)
    p $day
    $day = $day.sub(/^[0]+/, '')
    p $day
    $month = $date1.to_s.slice!(0, 2)
    p $month
  end
  step "the user clicks the calendar"
  step "the user clicks the month year"
  step "the user clicks the year"

  if ($year == "2016")
    step "the user clicks the year 2016"
  elsif ($year == "2017")
    step "the user clicks the year 2017"
  elsif ($year == "2018")
    step "the user clicks the year 2018"
  elsif ($year == "2019")
    step "the user clicks the year 2019"
  elsif ($year == "2020")
    step "the user clicks the year 2020"
  elsif ($year == "2021")
    step "the user clicks the year 2021"
  elsif ($year == "2022")
    step "the user clicks the year 2022"
  end
  if ($month == "01")
    step "the user clicks the month jan"
  elsif ($month == "02")
    step "the user clicks the month feb"
  elsif ($month == "03")
    step "the user clicks the month mar"
  elsif ($month == "04")
    step "the user clicks the month apr"
  elsif ($month == "05")
    step "the user clicks the month may"
  elsif ($month == "06")
    step "the user clicks the month jun"
  elsif ($month == "07")
    step "the user clicks the month jul"
  elsif ($month == "08")
    step "the user clicks the month aug"
  elsif ($month == "09")
    step "the user clicks the month sep"
  elsif ($month == "10")
    step "the user clicks the month oct"
  elsif ($month == "11")
    step "the user clicks the month nov"
  elsif ($month == "12")
    step "the user clicks the month dec"
  end
  step "the user clicks the day"
end

When(/^the user reads no of rows in the table (.+)$/) do |page_element1|
  $captured_value2 = @current_page.send(page_element1.gsub(" ", "_").downcase + "_element").rows.size-1
  $captured_value2 =$captured_value2.to_s
  p $captured_value2

end


When /^the user adds the values of column (.*) in (.*)$/ do |column_header, table|
  $total_cost = 0

  for row in 1..(@current_page.send(table.downcase.gsub(" ", "_")+ "_element").rows.size)
    $total_cost += @current_page.send(table.downcase.gsub(" ", "_")+ "_element")[row][column_header].text.to_i
    p $total_cost
  end
end


When (/^the user clicks the (.*) and selects item (.*) from (.*)$/) do |focus_control, items, unordered_list_element|
  sleep 1
  step "the user clicks the #{focus_control}"
  Watir::Wait.until(30) { @current_page.send(unordered_list_element.downcase.gsub(" ", "_") + "_element").exists? }
  ulist = @current_page.send(unordered_list_element.downcase.gsub(" ", "_") + "_element")
  items_array = items.split('|')
  items_array.each do |item|
    item = item.strip
    ulist.each do |li|
      #puts li.text
      found = false
      if !found && li.text.eql?(item)
        puts li.text
        li.click
        found = true
        break
      end
    end
  end
end


When (/^the user selects item (.*) from (.*)$/) do |items, unordered_list_element|
  sleep 5
  Watir::Wait.until(30) { @current_page.send(unordered_list_element.downcase.gsub(" ", "_") + "_element").exists? }
  ulist = @current_page.send(unordered_list_element.downcase.gsub(" ", "_") + "_element")
  items_array = items.split('|')
  items_array.each do |item|
    item = item.strip
    ulist.each do |li|
      #puts li.text
      found = false
      if !found && li.text.eql?(item)
        puts li.text
        li.click
        found = true
        break
      end
    end
  end
end

When (/^the user selects the (.*) from the (.*)$/) do |type_click, page_element|
  @current_page.send(page_element.downcase.gsub(" ", "_") + "_element").each do |li|
    found = false
    if !found && li.text.include?(type_click)
      puts li.text
      li.click
      found = true
    end
  end
end


#pranay added

When /^the user clicked(?: the| a)? (.+) and (.+)$/ do |page_element, value|
  @current_page.enter_element_value(page_element, value)
  @current_page.send(page_element.gsub(" ", "_").downcase + "_element").click
end


And(/^the user navigates to the captured URL from salesforce$/) do
  p $captured_url_2
  @browser.goto($captured_url_2)
  step "the application navigates to the individual opportunity page"
end

And(/^the user refresh the page$/) do
  @browser.refresh
end


And(/^the user scroll down the page$/) do
  @browser.execute_script("window.scrollBy(0,400)")
end

Given(/^the user opens the viero application$/) do
  ai = WIN32OLE.new("WScript.Shell")
  p Dir.pwd
  ai.Run("C:/Users/1114813/AppData/Roaming/Microsoft/Windows/Start Menu/VIERO/VIERO.exe")
  sleep 10
  sleep 2
  ai.SendKeys('qastartup')
  sleep 2
  ai.SendKeys('{TAB}')
  ai.SendKeys('qa')
  ai.SendKeys('{TAB}')
  sleep 1
  ai.SendKeys('viero')
  sleep 1
  ai.SendKeys('{TAB}')
  ai.SendKeys('QA-Drat08')
  sleep 1
  ai.SendKeys('{TAB}')
  sleep 1

  ai.SendKeys('{ENTER}')


end

And(/^the user verifies (.+)$/) do |page_element|
  p page_element
  sleep 1
  Watir::Wait.until(30){@current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists?}
  @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? ? (puts "Element is present") : (puts "Element is not present")
  exp_value = @current_page.send((page_element.gsub(" ", "_") + "_element").downcase).text.to_s
  p "Subbu"
  p "expected value is" + exp_value
  # .should(expected_value == "Checked" ? be_true : be_false)

  # field_type = @current_page.send((field.gsub(" ","_") + "_element").downcase).class.to_s
  #p field_type


  #@current_page.send((page_element + "_checked?").gsub(" ","_").downcase).should(expected_value == "checked" ? be_true : be_false)


end

When /^the user waits until the order ID is available and captures the order ID (.*)$/ do |viero_value|

  Watir::Wait.until(30) { @current_page.send(viero_value.gsub(" ", "_").downcase + "_element").exists? }
  $viero = @current_page.send(viero_value.gsub(" ", "_").downcase)
  p $viero
  attempt = 0
  while ($viero == "") && (attempt < 270)
    sleep 10
    @browser.refresh
    attempt +=1
    $viero = @current_page.send(viero_value.gsub(" ", "_").downcase)
  end
  $order_id = @current_page.send(viero_value.gsub(" ", "_").downcase)
  puts $order_id
  p $order_id
end


When /^the user waits until the order ID is available and captures the order ID in bottom (.*)$/ do |viero_value|

  Watir::Wait.until(30) { @current_page.send(viero_value.gsub(" ", "_").downcase + "_element").exists? }
  $viero_bottom = @current_page.send(viero_value.gsub(" ", "_").downcase)
  p $viero_bottom = $viero_bottom.gsub("VIERO Order ID: ", "").to_s
  attempt = 0
  while ($viero_bottom == "") && (attempt < 270)
    sleep 10
    @browser.refresh
    attempt +=1
    $viero_bottom = @current_page.send(viero_value.gsub(" ", "_").downcase)
    p $viero_bottom = $viero_bottom.gsub("VIERO Order ID: ", "").to_s
  end
  $order_id_bottom = @current_page.send(viero_value.gsub(" ", "_").downcase)
  puts $order_id_bottom
  $order_id_bottom = $order_id_bottom.gsub("VIERO Order ID: ", "").to_s
  p $order_id_bottom
  $order_id_bottom == $order_id
end
################################RIAZE
And(/^the user maximize the window$/) do
  @browser.window.maximize
end

And(/^the page displays the (.*) graph$/) do |graph_type|
  @current_page.send(graph_type.gsub(" ", "_").downcase + "_graph").should be_true, graph_type + "Graph Not Found"
end

And(/^the user verifies the graph (.*) as (.*)$/) do |para, value|
  @current_page.send("verify_the_graph", para, value).should be_true, "Verify Graph" + "---Values not correct"
end

When /^the user fills in the captured (.*) for (.+)$/ do |value,page_element|

  case value.downcase.gsub(' ','_')
    when /account1/

    @current_page.enter_element_value(page_element, $accountname1)
      puts $accountname1
    else
      @current_page.enter_element_value(page_element, $captured_value)
      puts $captured_value
  end

end

When /^the user captures the value for account1 (.+)$/ do |page_element|
  Watir::Wait.until(30) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").exists? }
  $accountname1 = @current_page.send(page_element.gsub(" ", "_").downcase)
  p $accountname1
end

And(/^the user captures the value (.*) in array$/) do |locator|
  Watir::Wait.until(15) { @current_page.send(locator.gsub(" ", "_").downcase + "_element").present? }
  puts $captured_results[locator.gsub(" ", "_").downcase.to_s]
  check  = @current_page.send(locator.gsub(" ", "_").downcase).to_s
  case locator.downcase.gsub(" ","_")
    when /current_time/
      $captured_results[locator.gsub(" ", "_").downcase.to_s].nil? ? $captured_results[locator.gsub(" ", "_").downcase.to_s] = Time.now.to_s : $captured_results[locator.gsub(" ", "_").downcase.to_s] << ',' + Time.now.to_s
    when /last_modified/
      $captured_results[locator.gsub(" ", "_").downcase.to_s].nil? ? $captured_results[locator.gsub(" ", "_").downcase.to_s] = @current_page.send(locator.gsub(" ", "_").downcase).match(/,(.*)/)[1].strip : $captured_results[locator.gsub(" ", "_").downcase.to_s] << ',' + @current_page.send(locator.gsub(" ", "_").downcase).match(/,(.*)/)[1].strip
    when /opportunity_id/
      @browser.url.match(/com\/(.*)$/)[1]
    $captured_results[locator.gsub(" ", "_").downcase.to_s].nil? ? $captured_results[locator.gsub(" ", "_").downcase.to_s] = @browser.url.match(/com\/(.*)$/)[1].strip : $captured_results[locator.gsub(" ", "_").downcase.to_s] << ',' +  @browser.url.match(/com\/(.*)$/)[1].strip
    when /row_1_col_1/
      if check.include? "SFO"
      puts "inside SFO"
      check =  check[4..-1]
      end
      $captured_results[locator.gsub(" ", "_").downcase.to_s].nil? ? $captured_results[locator.gsub(" ", "_").downcase.to_s] = check : $captured_results[locator.gsub(" ", "_").downcase.to_s] << ',' + check
    else
      $captured_results[locator.gsub(" ", "_").downcase.to_s].nil? ? $captured_results[locator.gsub(" ", "_").downcase.to_s] = @current_page.send(locator.gsub(" ", "_").downcase) : $captured_results[locator.gsub(" ", "_").downcase.to_s] << ',' + @current_page.send(locator.gsub(" ", "_").downcase)
  end
  puts locator.gsub(" ", "_").downcase.to_s
  puts $captured_results[locator.gsub(" ", "_").downcase.to_s]
end

And(/^the user waits the page to load$/) do
  Watir::Wait.until(30) { @browser_session.return_page_load_state }
end

And(/^the field (.*) defaults to (.*)$/) do |target, source|
  case source.downcase
    when /captured/

      source = source.gsub('captured', '').strip
      p $captured_results[source.gsub(" ", "_").downcase.to_s]
      p @current_page.send(target.gsub(" ", "_").downcase)
      Watir::Wait.until(30) { @current_page.send(target.gsub(" ", "_").downcase + "_element").present? }
      (/#{$captured_results[source.gsub(" ", "_").downcase.to_s]}/ =~ @current_page.send(target.gsub(" ", "_").downcase)).should be_true, "Expected #{target}-> #{@current_page.send(target.gsub(' ', '_').downcase)} to be #{$captured_results[source.gsub(" ", "_").downcase.to_s]}"
      when "''" , '""'

        source = ""
        p source
        p @current_page.send(target.gsub(" ", "_").downcase)
        Watir::Wait.until(30) { @current_page.send(target.gsub(" ", "_").downcase + "_element").present? }
        (source.to_s == @current_page.send(target.gsub(" ", "_").downcase).to_s.strip).should be_true, "Expected #{target}-> #{@current_page.send(target.gsub(' ', '_').downcase)} to be #{source.to_s}"
      else

      p source
      p @current_page.send(target.gsub(" ", "_").downcase)
      Watir::Wait.until(30) { @current_page.send(target.gsub(" ", "_").downcase + "_element").present? }
      (/#{source.to_s}/ =~ @current_page.send(target.gsub(" ", "_").downcase)).should be_true, "Expected #{target}-> #{@current_page.send(target.gsub(' ', '_').downcase)} to be #{source.to_s}"


  end
end
And(/^the column (.*) is (not present|present) in table (.*)$/) do |column,status,table|
  case status
    when 'not present'

      table_column_array = @current_page.send('get_table_header',table.downcase.gsub(' ' ,'_'))
      puts table_column_array
      (not table_column_array.include? column.to_s).should be_true,"Expected :-#{column} should not be present"
    when 'present'
      table_column_array = @current_page.send('get_table_header',table.downcase.gsub(' ' ,'_'))
      puts table_column_array
      (table_column_array.include? column.to_s).should be_true,"Expected :-#{column} should be present"
    else

  end
end

And(/^the user cleard the array for (.*)/) do |key|
  $captured_results[key.downcase.gsub(' ','_')] = nil
end

And(/^the user selects the (.*) market element for$/) do |label|
  @browser.option(:text => label).select
end

And(/^the user selects the (.*) option element for$/) do |label|
  @browser.option(:title => label).select
end


And(/^the user (check|select|click) (.+) for (.+) in (.+)$/) do |action, page_element, records, table|
  case records.downcase
    when /all/
      page_element = page_element.downcase.gsub(' ', '_') + '_elements'
      @current_page.send(page_element).each do |element|
        element.visible? ? element.click : ''
      end
    when /captured/

      element = $captured_results[records.gsub('Captured', '').strip.gsub(' ',"_").downcase]
      found_element = false
      @current_page.send(table.gsub(' ', '_').downcase+'_element').each_with_index do |row, index|
        row.each do |cell|
          p /#{element}/
          p index
          p cell.text()
          if (cell.text() =~ /#{element}/)
            found_element = true
            #if (cell.text() == '2001023762')

            p index
            p element
            # @current_page.send(page_element.downcase + '_all' +'_elements')each do |element|
            #   p e
            #   e.visible? ? e.click : ''
            # end
            # p page_element.downcase
            # p  @current_page.send(page_element.gsub(' ','_').downcase + '_elements')

            page_element_class = @current_page.send(page_element.gsub(' ', '_').downcase + '_elements')[index-1].class.to_s
            p page_element_class
            case page_element_class
              when /checkbox/i
                #value should be: "check" or "uncheck"
                @current_page.send(page_element.gsub(' ', '_').downcase + '_elements')[index-1].set
              when /link/i
                case table.downcase.gsub(' ', '_')
                  when /contact_table/
                    @current_page.send(page_element.gsub(' ', '_').downcase + '_elements')[index].click
                  else
                    @current_page.send(page_element.gsub(' ', '_').downcase + '_elements')[index-1].click
                end
                sleep 1
              else
                @current_page.send(page_element.gsub(' ', '_').downcase + '_elements')[index-1].click
                sleep 1

            end
            break
          end


        end
        found_element ? break : ''
      end
  end
end
################################RIAZE


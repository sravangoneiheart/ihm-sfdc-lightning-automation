When /^the user (check|uncheck)s (.*)$/ do |action, check_boxes|

  check_boxes.split(", ").each do |check_box|
    @current_page.enter_element_value(check_box, action)
  end
end



When /^the user (?:selects|fills in) "(.*)" for (.+)$/ do |value, page_element|
  case value.downcase
    when /captured/
       @current_page.enter_element_value(page_element, $captured_results[value.downcase.gsub('captured_result_','')])
      p $captured_results[value.downcase.gsub('captured_result_','')]
       p "****************"
    else
          @current_page.enter_element_value(page_element, value)
  end
end


When /^the user (?:fills|modifies) the (?:.+) page(?: (?:with|for|where) (.*))?$/ do |locator|

  if locator.nil?
    @current_page.instantiate_page_data_object()
  else
    @current_page.instantiate_page_data_object(locator.upcase.gsub(" ", "_"))
  end

  @current_page.fill_all_form_data()
  @browser_session.fill_step_hash[@current_page.class.to_s] = true
end

When /^the user views the page(?: again)?$/ do
  sleep 1
end

When /^the user selects the (\d)(?:st|nd|rd|th)? (.*) radio button$/ do |index, page_element|
  index_option = index.to_i - 1
  radio_button_name =  @current_page.send(page_element.downcase.gsub(" ", "_")+ "_element").attribute("name")
  @browser.radio(:name => "#{radio_button_name}", :index => index_option).set
end

When /^the user selects the (\d+)(?:st|nd|rd|th) option from the (.*)$/ do |index, field_name|
  Watir::Wait.until{ @current_page.send(field_name.downcase.gsub(" ", "_")+ "_element").visible? }
  @current_page.enter_element_value(field_name.downcase.gsub(" ", "_"), @current_page.send(field_name.downcase.gsub(" ", "_") + "_element").options[index.to_i].text)
end

When /^the user presses the (.*) keyboard key$/ do |key|
  begin
    @browser.send_keys(key.to_sym)
  rescue => e
    p e.to_s
    p "Invalid key!"
  end
end


When /^the user presses the charlotte$/ do |key|
    begin

    end


end

And(/^the user presses the (.*) key for (\d+) times$/) do |key,n|
  n.to_i.times do
  step 'the user presses the arrow_down keyboard key'
end
end

When (/^the user selects (.*) from (.*)$/) do |value, page_element|

  found =  @current_page.send(page_element.downcase.gsub(" ", "_")+ "_elements")
  p found
  found.each do |li|
    #p li.text
    if  li.text.include?(value)
         li.click
      puts li.text
      end
  end
end

And(/^the user selects the (.*) optgroup element for (.*)$/) do |label , value|
  @browser.optgroup(:label => label).option(:value => value).select
end





And(/^the user selects the (.*) market element for$/) do |label|
  @browser.option(:text => label).select
end


And(/^user scrolls into view for (.*)$/) do |page_element|

  element = @current_page.send(page_element.gsub(" ", "_")+"_element")
  element.wd.location_once_scrolled_into_view
end

# And(/^the user verifies the checkbox (.*)$/) do |title, check_boxes|
#   if ($title ==notchecked)
#   check_boxes.split(", ").each do |check_box|
#     @current_page.enter_element_value(check_box, action)
#
#   end
#   end
# end


When /^the user deletes all the source values in (.*)$/ do |locator|
  @current_page.instantiate_page_data_object(locator)
  # elemnet_hash=@current_page.retrieve_data_for_value(locator)
  puts [locator]
  # (1..100).each do |i|
  #   field = 'value_' + i.to_s
  #   p field
  #   value=@current_page.retrieve_data_for_value(field)
  #   p value
  #   if value != ""
  #     begin
  #       xpath='.//*[contains(@title,\"' + value + '\") and contains(@title,\"Del\")]'
  #       java_script="var objSelect=document.evaluate('" + xpath + "', document, null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;"
  #       java_script=java_script + "objSelect.click();"
  #       p java_script
  #       @current_page.execute_script(java_script)
  #       step "the user confirms on the alert box"
  #       sleep 2
  #       @current_page.send("check_field" + "_element" ).click
  #       sleep 2
  #       @current_page.send("save" + "_element" ).click
  #       sleep 8
  #     end
  #   else
  #     break;
  #   end
  # end
end
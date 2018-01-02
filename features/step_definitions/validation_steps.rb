When /^the (.*) value (?:defaults to|is)( not)? (.*)$/ do |page_element, is_not, value|
  p value
  if value.include? "<%=$captured_results['last_modified']%>"

    @bulk_api = SalesforceBulk::Api.new("riazeabdul@iheartmedia.com.crmuat",'Password234Jo8ELt8dB8vJg1fMzeC33Nu4',true)
    p "select Last_Billing_Data_Change_Date__c,LastModifiedDate from Account where customer_id__c = '#{$captured_results['customer_id']}'"
    salesforce_data = @bulk_api.query('Account', "select Last_Billing_Data_Change_Date__c,LastModifiedDate from Account where customer_id__c = '#{$captured_results['customer_id']}'")
    p salesforce_data.result.records
    p salesforce_data.result.records[0].to_hash.values[0]
    p salesforce_data.result.records[0].to_hash.values[1]
    ($last_billing == salesforce_data.result.records[0].to_hash.values[1]).should be_false
    $last_billing = salesforce_data.result.records[0].to_hash.values[1]
  elsif value.include? '<%'
    case is_not
      when /not/
        value = ERB.new(value).result(binding)
        puts "EXP:-#{value} <-----> ACT:-#{@current_page.send(page_element.gsub(" ", "_").downcase).strip}"
        (@current_page.send(page_element.gsub(" ", "_").downcase).strip == value).should be_false
      else
        value = ERB.new(value).result(binding)
        field = @current_page.send(page_element.gsub(" ", "_").downcase + "_element").class.to_s
        puts field
        case field
          when /Link/
            puts "EXP:-#{value} <-----> ACT:-#{@current_page.send(page_element.gsub(" ", "_").downcase+ "_element").text.strip}"
            (@current_page.send(page_element.gsub(" ", "_").downcase+ "_element").text.strip == value).should be_true
          else
            puts "EXP:-#{value} <-----> ACT:-#{@current_page.send(page_element.gsub(" ", "_").downcase).strip}"
            (@current_page.send(page_element.gsub(" ", "_").downcase).strip == value).should be_true
        end

    end
  else


    field_type = @current_page.send((page_element.gsub(" ", "_") + "_element").downcase).class.to_s
    expectation = (is_not.nil? ? be_true : be_false)
    case field_type
      when /radio/i
        @current_page.send((page_element + "_#{value}_radio_selected?").downcase.gsub(" ", "_")).should expectation
      else
        value = (value == "blank" ? "" : value)
        (@current_page.send(page_element.gsub(" ", "_").downcase).strip == value).should expectation
        p value
    end

  end
end

And(/^the (.*) value rounding defaults to "([^"]*)"$/) do |page_element, value|
  #Subbu  - introducing below conversion for BMS CPP validation
  field_type = @current_page.send((page_element.gsub(" ", "_") + "_element").downcase).class.to_s
  # expectation = (is_not.nil? ? be_true : be_false)
  value = value.to_f
  p value
  case field_type
    when /radio/i
      @current_page.send((page_element + "_#{value}_radio_selected?").downcase.gsub(" ", "_")).should be_true
    else
      # value = value.round(3).to_s[0..3].to_f
      p @current_page.send(page_element.gsub(" ", "_").downcase).strip
      puts @current_page.send(page_element.gsub(" ", "_").downcase).strip.to_f.round(3).to_s[0..3].to_f
      (@current_page.send(page_element.gsub(" ", "_").downcase).strip.to_f.round(3).to_s[0..3].to_f == value).should be_true
  end
end


When /^the field values are correct for (.*)$/ do |locator|
  @current_page.class.data_class.get_expected_data(locator).each do |page_element, expected_value|
    # p "subbu is validating..."
    p expected_value
    next if expected_value.nil?
    field_type = @current_page.send((page_element.gsub(" ", "_") + "_element").downcase).class.to_s
    # p field_type
    if (expected_value =~ /^\s*lambda/i) != nil
      expected_value = eval(expected_value).call(@browser_session)
    end

    case field_type
      when /radio/i
        @current_page.send((page_element + "_#{expected_value}_selected?").gsub(" ", "_").downcase).should be_true
      when /checkbox/i
        @current_page.send((page_element + "_checked?").gsub(" ", "_").downcase).should(expected_value == "check" ? be_true : be_false)
      when /label/i
        parent_node = @current_page.send(page_element.gsub(" ", "_").downcase + "_element").parent

        #If not a checkbox label nor radio button label, what label is it? This should error in this case
        if parent_node.element.checkbox.exists?
          parent_node.element.checkbox.checked?.should(expected_value == "check" ? be_true : be_false)
        elsif parent_node.radio.exists?
          if expected_value == "nil" or expected_value == ""
            step "the #{page_element} radio group has no selection"
          else
            @current_page.send((page_element + "_#{expected_value}_radio_selected?").gsub(" ", "_").downcase).should be_true
          end
        else
          raise "Label associated with unexpected field type. Check the expected key/value"
        end
      when /text|select/i #assume straight up text comparison for text field or select list
        actual_data = @current_page.send(page_element.gsub(" ", "_").downcase).strip
        (actual_data.to_s == expected_value.to_s).should be_true, page_element.to_s + "\nexpected #{actual_data} to be #{expected_value}"
      when /span|div/i
        actual_data = @current_page.send(page_element.gsub(" ", "_").downcase)
        # p "subbu..."
        # p actual_data
        (actual_data.to_s == expected_value.to_s).should be_true, page_element.to_s + "\nexpected #{actual_data} to be #{expected_value}"
      else
        actual_data = @current_page.send(page_element.gsub(" ", "_").downcase + "_element").text
        if (actual_data.to_s.start_with?("Column Settings"))
          actual_data = actual_data.sub("Column Settings\n", "")
        end
        (actual_data.to_s == expected_value.to_s).should be_true, page_element.to_s + "\nexpected #{actual_data} to be #{expected_value}"
    end
  end
end

When /^the (.*) radio group (has a|has no) selection$/ do |page_element, expectation|
  @current_page.radio_list_for_group(page_element).inject(0) { |sum, radio|
    sum += 1 if radio.set?
    sum
  }.should == (expectation == "has a" ? 1 : 0)
end

When /^the (.+) checkbox is (checked|unchecked|disabled|enabled)$/ do |checkbox_name, checkbox_status|
  Watir::Wait.until(10) { @current_page.send(checkbox_name.gsub(" ", "_").downcase + "_element").present? }
  @current_page.verify_checkbox_status(checkbox_name.gsub(" ", "_").downcase, checkbox_status).should be_true
end

When /^the page (displays|does not display) the (.*) (?:field|dialog|element|section|checkbox)$/ do |expectation, field|
  (@current_page.send(field.gsub(" ", "_").downcase + "_element").exists? and
      @current_page.send(field.gsub(" ", "_").downcase + "_element").visible?).should(expectation == "displays" ? be_true : be_false)

end

When /^the (pick list|radio group) values for (.*) are correct(?: (?:for the |for )?(.+))?$/ do |field_type, field, condition|
  pick_list_key_for_yml = (condition.nil? ? field : "#{condition}_#{field}").gsub(" ", "_").upcase
  field_name = field.downcase.gsub(" ", "_")

  case field_type
    when "pick list"
      expected_pick_list_values = @current_page.class.data_class.get_pick_list_values(pick_list_key_for_yml)
      actual_field_values = nil
      keep_trying_to_set(5) {
        actual_field_values = @current_page.send(field_name + "_element").element.elements.map { |option| (option.class.to_s == "String" ? option.strip : option.text.strip) }
      }
    when "radio group"
      expected_pick_list_values = @current_page.class.data_class.get_radio_group_values(pick_list_key_for_yml)
      actual_field_values = @current_page.labels_from_radio_group(field_name)
    else
      raise "Field type not supported in this step definition"
  end
  actual_field_values.should == expected_pick_list_values
end

When /^the page (displays|does not display) the following (?:element|field)(?:s)?(?: as (enabled|disabled))?:$/ do |expectation, status, table_of_fields|
  table_of_fields.raw.flatten.each do |field|
    p field
    field_type = @current_page.send((field.gsub(" ", "_") + "_element").downcase).class.to_s
    #p field_type
    if field_type =~ /select/i
      @current_page.send(field.gsub(" ", "_").downcase + "_element").exists?
    else
      #Subbu - Added for debugging
      # $exist = @current_page.send(field.gsub(" ","_").downcase + "_element").exists?
      # $visible = @current_page.send(field.gsub(" ","_").downcase + "_element").visible?
      # p $exist
      # p $visible
      (@current_page.send(field.gsub(" ", "_").downcase + "_element").exists? and
          @current_page.send(field.gsub(" ", "_").downcase + "_element").visible?).should(expectation == "displays" ? be_true : be_false)
      @current_page.send(field.gsub(" ", "_").downcase + "_element").enabled?.should(status == "enabled" ? be_true : be_false) unless status.nil?
    end
  end
end

When /^the (error message|warning message|success message|text) for (.+) is (not )?displayed(?: (?:in|as) the (.*))?$/ do |message_type, message_key, not_displayed, area|
  message = case message_type
              when "error message"
                @current_page.class.data_class.get_error_message(message_key)
              when "warning message"
                @current_page.class.data_class.get_warning_message(message_key)
              when "success message"
                @current_page.class.data_class.get_success_message(message_key)
              when "text"
                @current_page.class.data_class.get_text_message(message_key)
            end
  message.gsub!(/\s+/, " ")
  candidate_text = if area
                     if @current_page.send(area.gsub(" ", "_").downcase + "_element").exists?
                       @current_page.send(area.gsub(" ", "_").downcase + "_element").text.gsub(/\s+/, " ").upcase
                     else
                       ""
                     end
                   else
                     @current_page.text.gsub(/\s+/, " ").upcase
                   end
  if message.length > 1 and message[0] == "/" and message[-1] == "/"
    if not_displayed
      candidate_text.should_not =~ /#{message[1, message.length-2]}/i
    else
      candidate_text.should =~ /#{message[1, message.length-2]}/i
    end
  else
    p candidate_text
    p message.upcase
    candidate_text.index(message.upcase).nil?.should(not_displayed.nil? ? be_false : be_true)
  end

end

When /^the (title|url) of the(?: new)? browser window (?:is|contains) (.*)$/ do |title_or_url, expected|
  Watir::Wait.until(10) { @browser.title =~ Regexp.new(expected) or @browser.url =~ Regexp.new(expected) }
  if title_or_url == "url"
    @browser.url.should =~ Regexp.new(expected)
  else
    @browser.title.should =~ Regexp.new(expected)
  end
end

When /^the (.+) (?:button|drop down|text field) is (disabled|enabled|not present|present)$/ do |element_name, element_status|
  @current_page.verify_element_status(element_name.gsub(" ", "_").downcase, element_status).should be_true
end

When /^an alert box opens with the text for (.*)$/ do |message_key|
  Watir::Wait.until(10) { @browser.alert.exists? }
  message = @current_page.class.data_class.get_text_message(message_key)
  @browser.alert.text.upcase.include?(message.upcase).should be_true
end

When(/^the user updates the date from (.*) to fill in (.*)$/) do |element1, element2|
  captured_date = @current_page.send(element1.gsub(" ", "_").downcase + "_element").value
  modified_date = Time.strptime(captured_date, "%m/%d/%Y") - (3*24*60*60)
  modified_date = modified_date.strftime("%m/%d/%Y")
  step "the user fills in \"#{modified_date}\" for #{element2}"
end

When /^the user captures page values$/ do
  @current_page.capture_values
end


And(/^ruby grabs saved value$/) do
  p SalesforceIndividualOpportunityPage.class_eval("@@test")
end

When /^the BMS gross amount is within (\d)% of the injected proposal amount$/ do |percentage|
  #Subbu - 08/18/2016 -  incorrect code
  # lower_bound = SalesforceIndividualOpportunityPage.class_eval("@@gross_amount")..gsub("$","").gsub(",","").to_f * (100-percentage.to_i)/100
  # upper_bound = SalesforceIndividualOpportunityPage.class_eval("@@gross_amount")..gsub("$","").gsub(",","").to_f * (100+percentage.to_i)/100
  #Subbu
  lower_bound = SalesforceIndividualOpportunityPage.class_eval("@@gross_amount").gsub("$", "").gsub(",", "").to_f * (100-percentage.to_i)/100
  upper_bound = SalesforceIndividualOpportunityPage.class_eval("@@gross_amount").gsub("$", "").gsub(",", "").to_f * (100+percentage.to_i)/100
  BMSOrderHeaderPage.class_eval("@@gross_amount").gsub("$", "").gsub(",", "").to_f.between?(lower_bound, upper_bound).should be_true
  #Subbu 08/18/2016 - added below lines
  puts "Gross Amount entered on GRP " + SalesforceIndividualOpportunityPage.class_eval("@@gross_amount")
  puts "Gross Amount on BMS " + BMSOrderHeaderPage.class_eval("@@gross_amount")
  puts "BMS Gross amount is with in 5% of injected proposal amount"
end

And(/^the col (.*)  is (greater) than (.*)$/) do |actual, comp, exp|
  case comp
    when /greater/

      p DateTime.strptime($captured_results[exp.gsub('captured_', '').gsub(' ', '_').downcase].to_s, "%m/%d/%Y")
      p DateTime.strptime(@current_page.send(actual.gsub(" ", "_").downcase).to_s.strip, "%m/%d/%Y")
      (DateTime.strptime(@current_page.send(actual.gsub(" ", "_").downcase).strip.to_s, "%m/%d/%Y") > DateTime.strptime($captured_results[exp.gsub('captured_', '').gsub(' ', '_').downcase].to_s, "%m/%d/%Y")).should be_true

    else

  end
end


And(/^the (.*) radio button is set$/) do |page_element|
  Watir::Wait.until(30) { @current_page.send(page_element.gsub(" ", "_").downcase + "_element").present? }
  @current_page.send((page_element + "_element").downcase.gsub(" ", "_")).checked?.should be_true
end

And(/^the user verifies the (.*) equals "([^"]*)"$/) do |captured_value,expected|

  case expected
    when /currentdate/i
      expected = DateTime.now().to_s[0..10]
      puts "EXP:-#{expected} <-----> ACT:-#{$captured_results[captured_value.gsub('captured_','')]}"
      ($captured_results[captured_value.gsub('captured_','')].to_s.include?(expected)).should be_true
    else

  puts "EXP:-#{expected} <-----> ACT:-#{$captured_results[captured_value.gsub('captured_','')]}"
  (expected.to_s == $captured_results[captured_value.gsub('captured_','')]).should be_true

      end
end
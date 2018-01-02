When /^the user queries the Inventory DayPart table$/ do
  sql = "select * from kund where NAMN = 'BI LO'"
  @results = ActiveRecord::Base.connection.select_all(sql)
  @results.each do |row|
    puts row
  end
end

Then /^the values for (.*) are correct$/ do |data_key|
  expected_data = DbValidationData.get_expected_data(data_key)
  actual_data = @results[0]
  actual_data.each do |actual_data_key, actual_data_value|
    if expected_data.keys.include? actual_data_key.gsub(" ", "_").upcase
      expected_data[actual_data_key.gsub(" ", "_").upcase].should == actual_data_value.to_s
    else
      raise("Invalid column name, please verify - #{expected_data.keys}")
    end
  end
end


When /^the user queries the viero account table$/ do
  p $account_id_2
  p $captured_value
  sql = "select * from kund where NAMN = " + "'" + $captured_value + "'"
  @results = ActiveRecord::Base.connection.select_all(sql)
  @results.each do |row|
    puts row

  end
end


And(/^the database values are correct for (.*) for (.*)$/) do |locator,query|

  locator  = locator.split(',')
  locator.each_with_index do |v,i|
  Watir::Wait.until(180) {@current_page.send('query_' + query.downcase.gsub(' ', '_'),i) != ''}
  db_results = @current_page.send('query_' + query.downcase.gsub(' ', '_'),i)
  actual_db_results = db_results.map { |k, v| [k.upcase, v] }.to_h
  p db_results
  p actual_db_results
  fail_flag = false
  fail_col = []

    @current_page.class.data_class.get_expected_data(v).each do |page_element, expected_value|

       expected_value.split(',').size > 1 ? (expected_value = expected_value.split(',')[i]):expected_value
      begin
        page_element == 'FRIENDLYID' ? (expected_value = expected_value[2..-1]) : expected_value

      if expected_value.to_s != actual_db_results[page_element].to_s
        fail_flag = true
        fail_col << page_element.to_s
      end
      puts page_element.to_s + '===>'+ 'ACT :' + actual_db_results[page_element].to_s + '<=========>' + 'EXP :' + expected_value.to_s + '**'

      rescue Exception => e
        puts e.message
        fail_flag = true
        next
      end
    end
  (!fail_flag).should be_true, "\nThe columns failed for #{fail_col}"
    end
end

And(/^the user queires Salesforce DB for (.*) object  for (.*) to be (.*)/) do |source,col_name,exp|

  bulk_api = SalesforceBulk::Api.new($salesforceuser,$salesforpwd,true)
  salesforce_data = bulk_api.query(sql.split('|')[0],sql.split('|')[1])
end

And(/^the user fills in the sql (.*) for (.*)/) do |sql,editor|

      value = ERB.new(sql).result(binding)
      p value
      Watir::Wait.until(15) { @current_page.send(editor.gsub(" ", "_").downcase + "_element").present? }
      @current_page.enter_element_value(editor, value)

end


